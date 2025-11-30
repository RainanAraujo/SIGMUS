import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:sigmus/theme/app_colors.dart';

class SelectOption<T> {
  final T value;
  final String label;

  const SelectOption({required this.value, required this.label});
}

class AppSearchableSelect<T> extends StatefulWidget {
  final String label;
  final String? hint;
  final T? value;
  final List<SelectOption<T>> options;
  final ValueChanged<T?>? onChanged;
  final bool isRequired;
  final bool enabled;
  final String? Function(T?)? validator;
  final String searchHint;
  final FocusNode? focusNode;

  const AppSearchableSelect({
    super.key,
    required this.label,
    this.hint,
    this.value,
    required this.options,
    this.onChanged,
    this.isRequired = false,
    this.enabled = true,
    this.validator,
    this.searchHint = 'Buscar...',
    this.focusNode,
  });

  @override
  State<AppSearchableSelect<T>> createState() => _AppSearchableSelectState<T>();
}

class _AppSearchableSelectState<T> extends State<AppSearchableSelect<T>> {
  late TextEditingController _controller;
  late FocusNode _autocompleteFocusNode;
  late FocusNode _focusableFocusNode;
  late ScrollController _scrollController;

  T? _selectedValue;
  bool _isFocused = false;
  Key _autocompleteKey = UniqueKey();
  BuildContext? _optionsContext;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.value;
    _controller = TextEditingController(text: _getSelectedLabel());
    _scrollController = ScrollController();

    _focusableFocusNode = widget.focusNode ?? FocusNode();

    _autocompleteFocusNode = FocusNode();
    _autocompleteFocusNode.skipTraversal = true;

    _autocompleteFocusNode.addListener(() {
      if (_autocompleteFocusNode.hasFocus) {
        _controller.selection = TextSelection(
          baseOffset: 0,
          extentOffset: _controller.text.length,
        );
      }
    });
  }

  @override
  void didUpdateWidget(AppSearchableSelect<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      _selectedValue = widget.value;
      _controller.text = _getSelectedLabel();
    }
    if (widget.options != oldWidget.options) {
      _controller.text = _getSelectedLabel();
      setState(() {
        _autocompleteKey = UniqueKey();
      });
    }
  }

  String _getSelectedLabel() {
    final selected = widget.options
        .where((o) => o.value == _selectedValue)
        .firstOrNull;
    return selected?.label ?? '';
  }

  @override
  void dispose() {
    _controller.dispose();
    _autocompleteFocusNode.dispose();
    if (widget.focusNode == null) {
      _focusableFocusNode.dispose();
    }
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FormField<T>(
      initialValue: _selectedValue,
      validator: widget.validator,
      builder: (formState) {
        return FocusableActionDetector(
          focusNode: _focusableFocusNode,
          enabled: widget.enabled,
          actions: {
            ActivateIntent: CallbackAction<Intent>(
              onInvoke: (_) {
                if (widget.enabled) {
                  _autocompleteFocusNode.requestFocus();
                }
                return null;
              },
            ),
          },
          onFocusChange: (isFocused) {
            if (!isFocused && _selectedValue != null) {
              _controller.text = _getSelectedLabel();
            }
          },
          onShowFocusHighlight: (isFocused) {
            setState(() => _isFocused = isFocused);
          },
          mouseCursor: SystemMouseCursors.text,
          child: RawAutocomplete<SelectOption<T>>(
            key: _autocompleteKey,
            textEditingController: _controller,
            focusNode: _autocompleteFocusNode,
            optionsBuilder: (textEditingValue) {
              if (textEditingValue.text.isEmpty) {
                return widget.options;
              }
              return widget.options.where(
                (option) => option.label.toLowerCase().contains(
                  textEditingValue.text.toLowerCase(),
                ),
              );
            },
            displayStringForOption: (option) => option.label,
            onSelected: (option) {
              setState(() => _selectedValue = option.value);
              widget.onChanged?.call(option.value);
              formState.didChange(option.value);
            },
            fieldViewBuilder:
                (context, controller, focusNode, onFieldSubmitted) {
                  return TextField(
                    controller: controller,
                    focusNode: focusNode,
                    enabled: widget.enabled,
                    style: Theme.of(context).textTheme.bodyMedium,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: widget.isRequired
                          ? '${widget.label} *'
                          : widget.label,
                      hintText: widget.hint ?? widget.searchHint,
                      errorText: formState.hasError
                          ? formState.errorText
                          : null,
                      enabledBorder: _isFocused
                          ? OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: AppColors.ring,
                                width: 2,
                              ),
                            )
                          : null,
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (_controller.text.isNotEmpty && widget.enabled)
                            IconButton(
                              icon: const Icon(Icons.close, size: 18),
                              focusNode: FocusNode(skipTraversal: true),
                              onPressed: () {
                                _controller.clear();
                                setState(() => _selectedValue = null);
                                widget.onChanged?.call(null);
                                formState.didChange(null);
                                focusNode.requestFocus();
                              },
                              splashRadius: 16,
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(
                                minWidth: 32,
                                minHeight: 32,
                              ),
                            ),
                          const Icon(Icons.keyboard_arrow_down, size: 20),
                          const SizedBox(width: 8),
                        ],
                      ),
                    ),
                    onTap: () {
                      if (_controller.text.isNotEmpty &&
                          _selectedValue != null) {
                        _controller.selection = TextSelection(
                          baseOffset: 0,
                          extentOffset: _controller.text.length,
                        );
                      }
                    },
                    onSubmitted: (_) => onFieldSubmitted(),
                  );
                },
            optionsViewBuilder: (context, onSelected, options) {
              _optionsContext = context;
              final optionsList = options.toList();

              return Align(
                alignment: Alignment.topLeft,
                child: Material(
                  elevation: 4,
                  color: AppColors.popover,
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    constraints: const BoxConstraints(maxHeight: 200),
                    width: MediaQuery.of(context).size.width - 96,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: optionsList.isEmpty
                          ? const Padding(
                              padding: EdgeInsets.all(12),
                              child: Text(
                                'Nenhum resultado encontrado',
                                style: TextStyle(
                                  color: AppColors.mutedForeground,
                                ),
                              ),
                            )
                          : _OptionsListView<T>(
                              options: optionsList,
                              selectedValue: _selectedValue,
                              onSelected: (option) {
                                onSelected(option);
                                // Move focus to next field using the correct context
                                FocusScope.of(context).nextFocus();
                              },
                              scrollController: _scrollController,
                            ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class _OptionsListView<T> extends StatelessWidget {
  final List<SelectOption<T>> options;
  final T? selectedValue;
  final void Function(SelectOption<T>) onSelected;
  final ScrollController scrollController;

  const _OptionsListView({
    required this.options,
    required this.selectedValue,
    required this.onSelected,
    required this.scrollController,
  });

  static const double _itemHeight = 40.0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      padding: const EdgeInsets.symmetric(vertical: 4),
      shrinkWrap: true,
      itemCount: options.length,
      itemExtent: _itemHeight,
      itemBuilder: (context, index) {
        final option = options[index];
        final isSelected = option.value == selectedValue;

        return Builder(
          builder: (context) {
            final highlightedIndex = AutocompleteHighlightedOption.of(context);
            final isHighlighted = highlightedIndex == index;

            SchedulerBinding.instance.addPostFrameCallback((_) {
              if (isHighlighted && scrollController.hasClients) {
                final itemOffset = index * _itemHeight;
                final viewportHeight =
                    scrollController.position.viewportDimension;
                final currentScroll = scrollController.offset;

                if (itemOffset < currentScroll) {
                  scrollController.animateTo(
                    itemOffset,
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.easeOut,
                  );
                } else if (itemOffset + _itemHeight >
                    currentScroll + viewportHeight) {
                  scrollController.animateTo(
                    itemOffset + _itemHeight - viewportHeight,
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.easeOut,
                  );
                }
              }
            });

            return InkWell(
              onTap: () => onSelected(option),
              focusNode: FocusNode(skipTraversal: true),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                color: isHighlighted
                    ? AppColors.accent
                    : isSelected
                    ? AppColors.accent.withOpacity(0.5)
                    : Colors.transparent,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        option.label,
                        style: TextStyle(
                          color: AppColors.foreground,
                          fontWeight: isSelected
                              ? FontWeight.w500
                              : FontWeight.w400,
                        ),
                      ),
                    ),
                    if (isSelected)
                      const Icon(
                        Icons.check,
                        size: 16,
                        color: AppColors.foreground,
                      ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
