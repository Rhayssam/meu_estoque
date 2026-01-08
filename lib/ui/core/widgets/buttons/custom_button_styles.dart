import 'package:flutter/material.dart';

extension CustomButtonStyles on ThemeData {
  ButtonStyle get primaryButtonStyle => ElevatedButton.styleFrom(
    backgroundColor: colorScheme.primary,
    foregroundColor: colorScheme.onPrimary,
    iconColor: colorScheme.onPrimary,
  );

  ButtonStyle get secondaryButtonStyle => ElevatedButton.styleFrom(
    backgroundColor: colorScheme.secondary,
    foregroundColor: colorScheme.onSecondary,
    iconColor: colorScheme.onSecondary,
    side: BorderSide(
      color: colorScheme.onSecondary,
      width: 1,
    ),
  );

  ButtonStyle get tertiaryButtonStyle => ElevatedButton.styleFrom(
    backgroundColor: colorScheme.tertiary,
    foregroundColor: colorScheme.onTertiary,
    iconColor: colorScheme.onTertiary,
  );

  ButtonStyle get alertButtonStyle => ElevatedButton.styleFrom(
    backgroundColor: colorScheme.error,
    foregroundColor: colorScheme.onError,
    iconColor: colorScheme.onError,
  );
}
