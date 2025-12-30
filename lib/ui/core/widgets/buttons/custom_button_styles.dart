import 'package:flutter/material.dart';

extension CustomButtonStyles on ThemeData {
  ButtonStyle get primaryButtonStyle => ElevatedButton.styleFrom(
    backgroundColor: colorScheme.primary,
    foregroundColor: colorScheme.onPrimary,
    iconColor: colorScheme.onPrimary,
  );

  ButtonStyle get alertButtonStyle => ElevatedButton.styleFrom(
    backgroundColor: colorScheme.error,
    foregroundColor: colorScheme.onError,
    iconColor: colorScheme.onError,
  );
}
