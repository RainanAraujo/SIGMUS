import 'package:flutter/material.dart';

class AppDropdown<T> extends StatelessWidget {
  final T? value;
  final String label;
  final String? hint;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?>? onChanged;
  final bool isRequired;
  final bool enabled;
  final String? Function(T?)? validator;

  const AppDropdown({
    super.key,
    this.value,
    required this.label,
    this.hint,
    required this.items,
    this.onChanged,
    this.isRequired = false,
    this.enabled = true,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        labelText: isRequired ? '$label *' : label,
        hintText: hint,
      ),
      items: items,
      onChanged: enabled
          ? (newValue) {
              onChanged?.call(newValue);
              // Move focus to next field after selection
              FocusScope.of(context).nextFocus();
            }
          : null,
      validator: validator,
      isExpanded: true,
      icon: const Icon(Icons.keyboard_arrow_down, size: 20),
    );
  }
}
