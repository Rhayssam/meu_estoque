import 'package:flutter/material.dart';

class BottomSheetMenu extends StatelessWidget {
  const BottomSheetMenu({
    super.key,
    required this.label,
    required this.child,
    this.decoration,
    this.controller,
    this.minHeight = 0.0,
    this.maxHeight = double.infinity,
    this.isDismissible = true,
    this.isScrollControlled = false,
    this.validator,
    this.isLoading = false,
    this.labelColor,
    this.borderColor,
    this.textColor,
    this.suffixIconColor,
  });

  final String label;
  final TextEditingController? controller;
  final bool isDismissible;
  final bool isScrollControlled;
  final double minHeight;
  final double maxHeight;
  final Widget child;
  final InputDecoration? decoration;
  final FormFieldValidator<String>? validator;
  final bool isLoading;
  final Color? labelColor;
  final Color? borderColor;
  final Color? textColor;
  final Color? suffixIconColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return TextFormField(
      controller: controller,
      enableInteractiveSelection: false,
      readOnly: true,
      canRequestFocus: false,
      autofocus: false,
      validator: validator,
      style: TextStyle(
        color: textColor ?? colorScheme.onSurface,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        fillColor: decoration?.fillColor ?? colorScheme.primaryContainer,
        filled: decoration?.filled ?? true,
        suffixIcon: decoration?.suffixIcon ??
            (isLoading
                ? const Padding(
                    padding: EdgeInsets.all(12),
                    child: SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  )
                : Icon(
                    Icons.arrow_drop_down,
                    color: suffixIconColor ?? colorScheme.onSurfaceVariant,
                  )),
        label: decoration?.label ?? Text(label),
        labelStyle: TextStyle(
          color: labelColor ?? colorScheme.onSurface,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: borderColor ?? colorScheme.outline,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: borderColor ?? colorScheme.primary,
            width: 1.5,
          ),
        ),
      ),
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        _showBottomSheet(context);
      },
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      useSafeArea: true,
      isScrollControlled: isScrollControlled,
      isDismissible: isDismissible,
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      constraints: BoxConstraints(
        minWidth: double.infinity,
        minHeight: minHeight,
        maxHeight: maxHeight,
      ),
      builder: (context) => SafeArea(child: child),
    );
  }
}
