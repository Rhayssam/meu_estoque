import 'package:flutter/material.dart';

extension ColorSchemeExtension on ColorScheme {
  Color get shimmerBackground => brightness == Brightness.dark ? Colors.grey.shade800 : Colors.grey.shade300;
  Color get shimmerHighlight => brightness == Brightness.dark ? Colors.grey.shade700 : Colors.grey.shade200;
}
