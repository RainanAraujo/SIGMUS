import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sigmus/theme/app_colors.dart';

class AppDateRangePicker extends StatefulWidget {
  final String label;
  final DateTime? startDate;
  final DateTime? endDate;
  final ValueChanged<DateTimeRange?>? onChanged;
  final bool isRequired;
  final bool enabled;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final String? placeholder;

  const AppDateRangePicker({
    super.key,
    required this.label,
    this.startDate,
    this.endDate,
    this.onChanged,
    this.isRequired = false,
    this.enabled = true,
    this.firstDate,
    this.lastDate,
    this.placeholder,
  });

  @override
  State<AppDateRangePicker> createState() => _AppDateRangePickerState();
}

class _AppDateRangePickerState extends State<AppDateRangePicker> {
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  String _formatDateRange() {
    if (widget.startDate == null || widget.endDate == null) {
      return widget.placeholder ?? 'Selecione a data';
    }

    final format = DateFormat('dd \'de\' MMM \'de\' yy', 'pt_BR');
    if (widget.startDate == widget.endDate) {
      return format.format(widget.startDate!);
    }
    return '${format.format(widget.startDate!)} - ${format.format(widget.endDate!)}';
  }

  Future<void> _selectDateRange() async {
    final theme = Theme.of(context);

    // Tema customizado estilo shadcn/ui para o DateRangePicker
    final datePickerTheme = theme.copyWith(
      colorScheme: theme.colorScheme.copyWith(
        primary: AppColors.primary,
        onPrimary: AppColors.primaryForeground,
        surface: AppColors.background,
        onSurface: AppColors.foreground,
        surfaceContainerHighest: AppColors.muted,
        outline: AppColors.border,
      ),
      datePickerTheme: DatePickerThemeData(
        backgroundColor: AppColors.background,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: AppColors.border),
        ),
        headerBackgroundColor: AppColors.background,
        headerForegroundColor: AppColors.foreground,
        headerHeadlineStyle: theme.textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w600,
          color: AppColors.foreground,
        ),
        headerHelpStyle: theme.textTheme.bodySmall?.copyWith(
          color: AppColors.mutedForeground,
        ),
        weekdayStyle: theme.textTheme.bodySmall?.copyWith(
          color: AppColors.mutedForeground,
          fontWeight: FontWeight.w500,
        ),
        dayStyle: theme.textTheme.bodyMedium?.copyWith(
          color: AppColors.foreground,
        ),
        dayForegroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primaryForeground;
          }
          if (states.contains(WidgetState.disabled)) {
            return AppColors.mutedForeground.withOpacity(0.5);
          }
          return AppColors.foreground;
        }),
        dayBackgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primary;
          }
          return Colors.transparent;
        }),
        dayOverlayColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.hovered)) {
            return AppColors.accent;
          }
          if (states.contains(WidgetState.pressed)) {
            return AppColors.accent;
          }
          return null;
        }),
        todayForegroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primaryForeground;
          }
          return AppColors.primary;
        }),
        todayBackgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primary;
          }
          return Colors.transparent;
        }),
        todayBorder: const BorderSide(color: AppColors.primary, width: 1),
        rangePickerBackgroundColor: AppColors.background,
        rangePickerSurfaceTintColor: Colors.transparent,
        rangePickerElevation: 0,
        rangePickerShadowColor: Colors.transparent,
        rangePickerShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: AppColors.border),
        ),
        rangePickerHeaderBackgroundColor: AppColors.background,
        rangePickerHeaderForegroundColor: AppColors.foreground,
        rangePickerHeaderHeadlineStyle: theme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
          color: AppColors.foreground,
        ),
        rangePickerHeaderHelpStyle: theme.textTheme.bodySmall?.copyWith(
          color: AppColors.mutedForeground,
        ),
        rangeSelectionBackgroundColor: AppColors.primary.withOpacity(0.1),
        rangeSelectionOverlayColor: WidgetStateProperty.all(
          AppColors.primary.withOpacity(0.1),
        ),
        dividerColor: AppColors.border,
        inputDecorationTheme: theme.inputDecorationTheme,
        cancelButtonStyle: TextButton.styleFrom(
          foregroundColor: AppColors.mutedForeground,
          textStyle: theme.textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        confirmButtonStyle: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          textStyle: theme.textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        yearStyle: theme.textTheme.bodyMedium?.copyWith(
          color: AppColors.foreground,
        ),
        yearForegroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primaryForeground;
          }
          if (states.contains(WidgetState.disabled)) {
            return AppColors.mutedForeground.withOpacity(0.5);
          }
          return AppColors.foreground;
        }),
        yearBackgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primary;
          }
          return Colors.transparent;
        }),
        yearOverlayColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.hovered)) {
            return AppColors.accent;
          }
          if (states.contains(WidgetState.pressed)) {
            return AppColors.accent;
          }
          return null;
        }),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );

    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: widget.firstDate ?? DateTime(2020),
      lastDate: widget.lastDate ?? DateTime(2030),
      initialDateRange: widget.startDate != null && widget.endDate != null
          ? DateTimeRange(start: widget.startDate!, end: widget.endDate!)
          : null,
      locale: const Locale('pt', 'BR'),
      builder: (context, child) {
        return Theme(
          data: datePickerTheme,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500, maxHeight: 500),
              child: child!,
            ),
          ),
        );
      },
    );

    if (picked != null) {
      widget.onChanged?.call(picked);
      FocusScope.of(context).nextFocus();
    } else {
      _focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final hasValue = widget.startDate != null && widget.endDate != null;

    return FocusableActionDetector(
      focusNode: _focusNode,
      enabled: widget.enabled,
      actions: {
        ActivateIntent: CallbackAction<Intent>(
          onInvoke: (_) {
            if (widget.enabled) {
              _selectDateRange();
            }
            return null;
          },
        ),
      },
      onShowFocusHighlight: (isFocused) {
        setState(() => _isFocused = isFocused);
      },
      mouseCursor: widget.enabled
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: widget.enabled ? _selectDateRange : null,
        child: InputDecorator(
          isFocused: _isFocused,
          decoration: InputDecoration(
            labelText: widget.isRequired ? '${widget.label} *' : widget.label,
            suffixIcon: const Icon(Icons.calendar_today, size: 18),
            enabled: widget.enabled,
            enabledBorder: _isFocused
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: AppColors.ring,
                      width: 2,
                    ),
                  )
                : null,
          ),
          child: Text(
            _formatDateRange(),
            style: TextStyle(
              color: hasValue
                  ? AppColors.foreground
                  : AppColors.mutedForeground,
            ),
          ),
        ),
      ),
    );
  }
}
