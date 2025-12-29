import 'package:flutter/material.dart';

extension CustomButtonStyles on ThemeData {
  ButtonStyle get primaryButtonStyle => ElevatedButton.styleFrom(
    backgroundColor: colorScheme.primary,
    foregroundColor: colorScheme.onPrimary,
    iconColor: colorScheme.onPrimary,
  );
}
