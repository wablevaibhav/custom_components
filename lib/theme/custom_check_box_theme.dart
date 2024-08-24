import 'package:flutter/material.dart';

class CustomCheckBoxTheme {
  CustomCheckBoxTheme._();

  // Light Custom CheckBox Theme
  static CheckboxThemeData lightCustomCheckBoxTheme = CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return Colors.blue;
      }
      return Colors.transparent;
    }),
    checkColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return Colors.white;
      }
      return Colors.black;
    }),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
  );

  // Dark Custom CheckBox Theme
  static CheckboxThemeData darkCustomCheckBoxTheme = CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return Colors.blue;
      }
      return Colors.transparent;
    }),
    checkColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return Colors.white;
      }
      return Colors.black;
    }),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
  );
}
