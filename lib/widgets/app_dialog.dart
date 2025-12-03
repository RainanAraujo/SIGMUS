import 'package:flutter/material.dart';
import 'package:sigmus/theme/app_colors.dart';
import 'package:sigmus/theme/app_typography.dart';

class AppDialog extends StatelessWidget {
  final String title;
  final String? description;
  final Widget child;
  final List<Widget>? actions;
  final double maxWidth;
  final double? maxHeight;
  final bool showCloseButton;
  final VoidCallback? onClose;

  const AppDialog({
    super.key,
    required this.title,
    this.description,
    required this.child,
    this.actions,
    this.maxWidth = 1000,
    this.maxHeight,
    this.showCloseButton = true,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.card,
      surfaceTintColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(24),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: AppColors.border),
      ),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: maxWidth,
          maxHeight: maxHeight ?? MediaQuery.of(context).size.height * 0.9,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHeader(context),

            Expanded(
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
                child: child,
              ),
            ),

            if (actions != null && actions!.isNotEmpty) _buildFooter(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTypography.sectionTitle),
                if (description != null) ...[
                  const SizedBox(height: 4),
                  Text(description!, style: AppTypography.sectionSubtitle),
                ],
              ],
            ),
          ),
          if (showCloseButton)
            SizedBox(
              width: 32,
              height: 32,
              child: IconButton(
                focusNode: FocusNode(skipTraversal: true),
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.close, size: 18),
                color: AppColors.mutedForeground,
                onPressed: () {
                  onClose?.call();
                  Navigator.of(context).pop();
                },
                tooltip: 'Fechar',
                style: IconButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          for (int i = 0; i < actions!.length; i++) ...[
            if (i > 0) const SizedBox(width: 8),
            actions![i],
          ],
        ],
      ),
    );
  }
}
