import 'package:flutter/material.dart';

class CustomColors {
  const CustomColors._();

  // Primary Colors
  static const CustomColor primary = CustomColor(
    _primaryColor,
    <int, Color>{
      100: Color(0xFFE3F2FD),
      200: Color(0xFFBBDEFB),
      300: Color(0xFF90CAF9),
      400: Color(0xFF64B5F6),
      500: Color(0xFF2196F3), // Main primary color
      600: Color(0xFF1E88E5),
      700: Color(0xFF1976D2),
      800: Color(0xFF1565C0),
      900: Color(0xFF0D47A1),
    },
  );
  static const int _primaryColor = 0xFF2196F3;

  // Secondary Colors
  static const CustomColor secondary = CustomColor(
    _secondaryColor,
    <int, Color>{
      100: Color(0xFFFCE4EC),
      200: Color(0xFFF8BBD0),
      300: Color(0xFFF48FB1),
      400: Color(0xFFF06292),
      500: Color(0xFFE91E63), // Main secondary color
      600: Color(0xFFD81B60),
      700: Color(0xFFC2185B),
      800: Color(0xFFAD1457),
      900: Color(0xFF880E4F),
    },
  );
  static const int _secondaryColor = 0xFFE91E63;

  // Warning Colors
  static const CustomColor warning = CustomColor(
    _warningColor,
    <int, Color>{
      100: Color(0xFFFFF3CD),
      200: Color(0xFFFFE8A1),
      300: Color(0xFFFFDD75),
      400: Color(0xFFFFD349),
      500: Color(0xFFFFC107), // Main warning color
      600: Color(0xFFFFB300),
      700: Color(0xFFFFA000),
      800: Color(0xFFFF8F00),
      900: Color(0xFFFF6F00),
    },
  );
  static const int _warningColor = 0xFFFFC107;

  // Success Colors
  static const CustomColor success = CustomColor(
    _successColor,
    <int, Color>{
      100: Color(0xFFE8F5E9),
      200: Color(0xFFC8E6C9),
      300: Color(0xFFA5D6A7),
      400: Color(0xFF81C784),
      500: Color(0xFF4CAF50), // Main success color
      600: Color(0xFF43A047),
      700: Color(0xFF388E3C),
      800: Color(0xFF2E7D32),
      900: Color(0xFF1B5E20),
    },
  );
  static const int _successColor = 0xFF4CAF50;

  // Danger Colors
  static const CustomColor danger = CustomColor(
    _dangerColor,
    <int, Color>{
      100: Color(0xFFFDECEA),
      200: Color(0xFFFACDCD),
      300: Color(0xFFF29B9B),
      400: Color(0xFFE66A6A),
      500: Color(0xFFDC3545), // Main danger color
      600: Color(0xFFC82333),
      700: Color(0xFFBD2130),
      800: Color(0xFFB21F2D),
      900: Color(0xFFAA1E2A),
    },
  );
  static const int _dangerColor = 0xFFDC3545;

  // Black & White Colors
  static const MaterialColor black = MaterialColor(
    _blackPrimaryValue,
    <int, Color>{
      50: Color(0xFF000000),
      100: Color(0xFF000000),
      200: Color(0xFF000000),
      300: Color(0xFF000000),
      400: Color(0xFF000000),
      500: Color(_blackPrimaryValue),
      600: Color(0xFF000000),
      700: Color(0xFF000000),
      800: Color(0xFF000000),
      900: Color(0xFF000000),
    },
  );
  static const int _blackPrimaryValue = 0xFF000000;

  static const CustomColor white = CustomColor(
    _whitePrimaryColor,
    <int, Color>{
      0: Color(_whitePrimaryColor),
      1: Color(0xFFFFFFFF),
      2: Color(0xFFFFFFFF),
      3: Color(0xFFFFFFFF),
      4: Color(0xFFFFFFFF),
      5: Color(0xFFFFFFFF),
      6: Color(0xFFFFFFFF),
      7: Color(0xFFFFFFFF),
      8: Color(0xFFFFFFFF),
      9: Color(0xFFFFFFFF),
      10: Color(0xFFFFFFFF),
    },
  );
  static const int _whitePrimaryColor = 0xFFFFFFFF;

  // Gray Colors
  static const CustomColor gray = CustomColor(
    _grayPrimaryColor,
    <int, Color>{
      0: Color(_grayPrimaryColor),
      1: Color(0xFFFAFAFA),
      2: Color(0xFFF2F2F2),
      3: Color(0xFFE6E6E6),
      4: Color(0xFFDADADA),
      5: Color(0xFFCCCCCC),
      6: Color(0xFF999999),
      7: Color(0xFF808080),
      8: Color(0xFF4D4D4D),
      9: Color(0xFF303030),
      10: Color(0xFF202020),
    },
  );
  static const int _grayPrimaryColor = 0xFFE6E6E6;

  // Disable Colors
  static const CustomColor disable = CustomColor(
    _disableColor,
    <int, Color>{
      100: Color(0xFFE2E3E4),
      200: Color(0xFF58595B),
    },
  );
  static const int _disableColor = 0xFF58595B;
}

class CustomColor extends ColorSwatch<int> {
  const CustomColor(super.primary, super.swatch);

  Color get shade1 => this[1]!;
  Color get shade2 => this[2]!;
  Color get shade3 => this[3]!;
  Color get shade4 => this[4]!;
  Color get shade5 => this[5]!;
  Color get shade6 => this[6]!;
  Color get shade7 => this[7]!;
  Color get shade8 => this[8]!;
  Color get shade9 => this[9]!;
  Color get shade10 => this[10]!;
}
