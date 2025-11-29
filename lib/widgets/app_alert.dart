import 'package:flutter/material.dart';
import 'package:sigmus/theme/app_colors.dart';

class AppAlert extends StatelessWidget {
  final String title;
  final String message;
  final String? cancelText;
  final String confirmText;
  final VoidCallback? onCancel;
  final VoidCallback onConfirm;
  final bool isDestructive;

  const AppAlert({
    super.key,
    required this.title,
    required this.message,
    this.cancelText,
    required this.confirmText,
    this.onCancel,
    required this.onConfirm,
    this.isDestructive = false,
  });

  static Future<bool?> show({
    required BuildContext context,
    required String title,
    required String message,
    String? cancelText,
    required String confirmText,
    bool isDestructive = false,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AppAlert(
        title: title,
        message: message,
        cancelText: cancelText,
        confirmText: confirmText,
        isDestructive: isDestructive,
        onCancel: () => Navigator.pop(context, false),
        onConfirm: () => Navigator.pop(context, true),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.card,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: AppColors.border),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.foreground,
          letterSpacing: -0.02,
        ),
      ),
      content: Text(
        message,
        style: const TextStyle(fontSize: 14, color: AppColors.mutedForeground),
      ),
      actions: [
        if (cancelText != null)
          TextButton(
            onPressed: onCancel ?? () => Navigator.pop(context),
            child: Text(
              cancelText!,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: isDestructive
                ? AppColors.destructiveForeground
                : AppColors.primaryForeground,
            backgroundColor: isDestructive
                ? AppColors.destructive
                : AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: onConfirm,
          child: Text(
            confirmText,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
