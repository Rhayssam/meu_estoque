import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meu_estoque/ui/core/theme/app_colors.dart';
import 'package:meu_estoque/ui/core/theme/app_colors_extensions.dart';

final class AppTheme {
  AppTheme({required this.colorScheme});

  static ThemeData light() {
    return AppTheme(colorScheme: AppColors.lightColorScheme).themeData;
  }

  final ColorScheme colorScheme;

  ThemeData get themeData => ThemeData(
    colorScheme: colorScheme,
    textTheme: textTheme,
    elevatedButtonTheme: elevatedButtonTheme,
    outlinedButtonTheme: outlinedButtonTheme,
    inputDecorationTheme: inputDecorationTheme,
    bannerTheme: bannerTheme,
    dialogTheme: dialogTheme,
    extensions: [AppColorsExtensions()],
  );

  TextTheme get textTheme => TextTheme(
    displayLarge: GoogleFonts.poppins(fontSize: 57, fontWeight: FontWeight.normal),
    displayMedium: GoogleFonts.poppins(fontSize: 45, fontWeight: FontWeight.normal),
    displaySmall: GoogleFonts.poppins(fontSize: 36, fontWeight: FontWeight.normal),
    headlineLarge: GoogleFonts.poppins(fontSize: 32, fontWeight: FontWeight.normal),
    headlineMedium: GoogleFonts.poppins(fontSize: 28, fontWeight: FontWeight.normal),
    headlineSmall: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.normal),
    titleLarge: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.normal),
    titleMedium: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.normal),
    titleSmall: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.normal),
    bodyLarge: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.normal),
    bodyMedium: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.normal),
    bodySmall: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.normal),
    labelLarge: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.normal),
    labelMedium: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.normal),
    labelSmall: GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.normal),
  );

  ElevatedButtonThemeData get elevatedButtonTheme => ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
      iconColor: colorScheme.onPrimary,
      iconSize: 24,
      padding: EdgeInsets.all(12),
      textStyle: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
    ),
  );

  InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
    iconColor: colorScheme.onSurface,
    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    isDense: false,
    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: colorScheme.onSurface.withValues(alpha: 0.5)),
      borderRadius: BorderRadius.all(Radius.circular(25)),
    ),
  );

  MaterialBannerThemeData get bannerTheme => MaterialBannerThemeData(
    backgroundColor: colorScheme.primary,
    dividerColor: Colors.transparent,
    contentTextStyle: textTheme.bodyMedium?.copyWith(color: colorScheme.onPrimary),
    elevation: 3,
    shadowColor: colorScheme.shadow.withValues(alpha: .3),
    padding: EdgeInsets.all(10),
  );

  DialogThemeData get dialogTheme => DialogThemeData(
    backgroundColor: colorScheme.primaryContainer,
    iconColor: colorScheme.onPrimaryContainer,
    shadowColor: colorScheme.shadow.withValues(alpha: .3),
    titleTextStyle: textTheme.titleLarge?.copyWith(color: colorScheme.onPrimaryContainer),
    contentTextStyle: textTheme.bodyMedium?.copyWith(color: colorScheme.onPrimaryContainer),
  );

  OutlinedButtonThemeData get outlinedButtonTheme => OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      backgroundColor: Colors.transparent,
      foregroundColor: colorScheme.onSurface,
      iconColor: colorScheme.onSurface,
      iconSize: 24,
      padding: EdgeInsets.all(12),
      textStyle: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}
