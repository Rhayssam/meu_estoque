import 'package:flutter/material.dart';
import 'package:meu_estoque/ui/core/widgets/buttons/custom_button_styles.dart';

enum CustomButtonStyleEnum {
  custom,
  primary,
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.style,
    this.icon,
    this.iconAlignment = IconAlignment.start,
  }) : customButtonStyleEnum = CustomButtonStyleEnum.custom;

  final void Function()? onPressed;
  final Widget label;
  final ButtonStyle? style;
  final Widget? icon;
  final IconAlignment iconAlignment;
  final CustomButtonStyleEnum customButtonStyleEnum;

  const CustomButton.primary({
    super.key,
    required this.onPressed,
    required this.label,
    this.icon,
    this.iconAlignment = IconAlignment.start,
  }) : customButtonStyleEnum = CustomButtonStyleEnum.primary,
       style = null;

  ButtonStyle? _getButtonStyle(BuildContext context) {
    return switch (customButtonStyleEnum) {
      CustomButtonStyleEnum.custom => style,
      CustomButtonStyleEnum.primary => Theme.of(context).primaryButtonStyle,
    };
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      key: key,
      onPressed: onPressed,
      label: label,
      style: _getButtonStyle(context),
      icon: icon,
      iconAlignment: iconAlignment,
    );
  }
}
