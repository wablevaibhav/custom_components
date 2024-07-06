import 'package:flutter/material.dart';

class CustomColors {
  const CustomColors._();

  static const CustomColor bluePrimary = CustomColor(
    _primaryColor,
    <int, Color>{
      100: Color(0xFFE9ECF4),
      200: Color(0xFFD4DAEA),
      300: Color(0xFF93A3CB),
      400: Color(0xFF496DAF),
      500: Color(0xFF1B489B),
    },
  );

  static const int _primaryColor = 0xFF1B489B;

  static const CustomColor blueSecondary = CustomColor(
    _secondaryColor,
    <int, Color>{
      100: Color(0xFFE7E7E9),
      200: Color(0xFFCECFD3),
      300: Color(0xFF858791),
      400: Color(0xFF3D3F50),
      500: Color(0xFF0C0F24),
    },
  );

  static const int _secondaryColor = 0xFF0C0F24;

  static const CustomColor warningPrimary = CustomColor(
    _warningPrimaryColor,
    <int, Color>{
      100: Color(0xFFFFE1A4),
      200: Color(0xFF895D0B),
    },
  );

  static const int _warningPrimaryColor = 0xFF895D0B;

  static const CustomColor successPrimary = CustomColor(
    _successPrimaryColor,
    <int, Color>{
      100: Color(0xFFCCF2DB),
      200: Color(0xFF1E774A),
    },
  );

  static const int _successPrimaryColor = 0xFF1E774A;

  static const CustomColor dangerPrimary = CustomColor(
    _dangerPrimaryColor,
    <int, Color>{
      0: Color(_dangerPrimaryColor),
      1: Color(0xFFfef7f8),
      2: Color(0xFFf7d3d6),
      3: Color(0xFFf1aeb5),
      4: Color(0xFFeb8a93),
      5: Color(0xFFe46572),
      6: Color(0xFFde4150),
      7: Color(0xFFc22f3d),
      8: Color(0xFF9a2530),
      9: Color(0xFF721c24),
      10: Color(0xFF4b1217),
    },
  );

  static const int _dangerPrimaryColor = 0xFFdc3545;

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
      1: Color(_whitePrimaryColor),
      2: Color(_whitePrimaryColor),
      3: Color(_whitePrimaryColor),
      4: Color(_whitePrimaryColor),
      5: Color(_whitePrimaryColor),
      6: Color(_whitePrimaryColor),
      7: Color(_whitePrimaryColor),
      8: Color(_whitePrimaryColor),
      9: Color(_whitePrimaryColor),
      10: Color(_whitePrimaryColor),
    },
  );
  static const int _whitePrimaryColor = 0xFFffffff;

  static const CustomColor disablePrimary = CustomColor(
    _disableColor,
    <int, Color>{
      100: Color(0xFFE2E3E4),
      200: Color(0xFF58595B),
    },
  );

  static const int _disableColor = 0xFF58595B;

  static const CustomColor gray = CustomColor(
    _grayPrimaryColor,
    <int, Color>{
      0: Color(_grayPrimaryColor),
      1: Color(0xFFfafafa),
      2: Color(0xFFf2f2f2),
      3: Color(0xFFe6e6e6),
      4: Color(0xFFdadada),
      5: Color(0xFFcccccc),
      6: Color(0xFF999999),
      7: Color(0xFF808080),
      8: Color(0xFF4d4d4d),
      9: Color(0xFF303030),
      10: Color(0xFF202020),
    },
  );

  static const int _grayPrimaryColor = 0xFFe6e6e6;
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
