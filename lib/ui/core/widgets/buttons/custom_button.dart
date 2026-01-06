import 'package:flutter/material.dart';
import 'package:meu_estoque/ui/core/widgets/buttons/custom_button_styles.dart';

enum CustomButtonStyleEnum {
  custom,
  primary,
  secondary,
  tertiary,
  alert,
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

  const CustomButton.secondary({
    super.key,
    required this.onPressed,
    required this.label,
    this.icon,
    this.iconAlignment = IconAlignment.start,
  }) : customButtonStyleEnum = CustomButtonStyleEnum.secondary,
       style = null;

  const CustomButton.tertiary({
    super.key,
    required this.onPressed,
    required this.label,
    this.icon,
    this.iconAlignment = IconAlignment.start,
  }) : customButtonStyleEnum = CustomButtonStyleEnum.tertiary,
       style = null;

  const CustomButton.alert({
    super.key,
    required this.onPressed,
    required this.label,
    this.icon,
    this.iconAlignment = IconAlignment.start,
  }) : customButtonStyleEnum = CustomButtonStyleEnum.alert,
       style = null;

  ButtonStyle? _getButtonStyle(BuildContext context) {
    return switch (customButtonStyleEnum) {
      CustomButtonStyleEnum.custom => style,
      CustomButtonStyleEnum.primary => Theme.of(context).primaryButtonStyle,
      CustomButtonStyleEnum.secondary => Theme.of(context).secondaryButtonStyle,
      CustomButtonStyleEnum.tertiary => Theme.of(context).tertiaryButtonStyle,
      CustomButtonStyleEnum.alert => Theme.of(context).alertButtonStyle,
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
