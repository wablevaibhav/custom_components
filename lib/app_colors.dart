import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Primary Colors
  static const MaterialColor primaryBlue = MaterialColor(
    _primaryBluePrimaryValue,
    <int, Color>{
      50: Color(0xFFE8EAF6),
      100: Color(0xFFC5CAE9),
      200: Color(0xFF9FA8DA),
      300: Color(0xFF7986CB),
      400: Color(0xFF5C6BC0),
      500: Color(_primaryBluePrimaryValue),
      600: Color(0xFF3949AB),
      700: Color(0xFF303F9F),
      800: Color(0xFF283593),
      900: Color(0xFF1A237E),
    },
  );
  static const int _primaryBluePrimaryValue = 0xFF281C9D;

  // Neutral Colors
  static const Color neutralDark = Color(0xFF343434); // Neutral Dark Grey
  static const Color neutralMedium = Color(0xFF898989); // Neutral Medium Grey
  static const Color neutralLight = Color(0xFF989898); // Neutral Grey
  static const Color neutralLighter = Color(0xFFCACACA); // Neutral Light Grey
  static const Color neutralPale = Color(0xFFE0E0E0); // Neutral Lighter Grey
  static const Color neutralWhite = Color(0xFFFFFFFF); // Neutral White

  // Semantic Colors
  static const MaterialColor errorRed = MaterialColor(
    // Error Red
    _semanticRedPrimaryValue,
    <int, Color>{
      50: Color(0xFFFFEBEE),
      100: Color(0xFFFFCDD2),
      200: Color(0xFFEF9A9A),
      300: Color(0xFFE57373),
      400: Color(0xFFEF5350),
      500: Color(_semanticRedPrimaryValue),
      600: Color(0xFFE53935),
      700: Color(0xFFD32F2F),
      800: Color(0xFFC62828),
      900: Color(0xFFB71C1C),
    },
  );
  static const int _semanticRedPrimaryValue = 0xFFFF4267;

  static const MaterialColor infoBlue = MaterialColor(
    // Info Blue
    _semanticBluePrimaryValue,
    <int, Color>{
      50: Color(0xFFE3F2FD),
      100: Color(0xFFBBDEFB),
      200: Color(0xFF90CAF9),
      300: Color(0xFF64B5F6),
      400: Color(0xFF42A5F5),
      500: Color(_semanticBluePrimaryValue),
      600: Color(0xFF1E88E5),
      700: Color(0xFF1976D2),
      800: Color(0xFF1565C0),
      900: Color(0xFF0D47A1),
    },
  );
  static const int _semanticBluePrimaryValue = 0xFF0890FE;

  static const MaterialColor warningYellow = MaterialColor(
    // Warning Yellow
    _semanticYellowPrimaryValue,
    <int, Color>{
      50: Color(0xFFFFFDE7),
      100: Color(0xFFFFF9C4),
      200: Color(0xFFFFF59D),
      300: Color(0xFFFFF176),
      400: Color(0xFFFFEE58),
      500: Color(_semanticYellowPrimaryValue),
      600: Color(0xFFFFEB3B),
      700: Color(0xFFFDD835),
      800: Color(0xFFFBC02D),
      900: Color(0xFFF9A825),
    },
  );
  static const int _semanticYellowPrimaryValue = 0xFFFFAF2A;

  static const MaterialColor successGreen = MaterialColor(
    // Success Green
    _semanticGreenPrimaryValue,
    <int, Color>{
      50: Color(0xFFE8F5E9),
      100: Color(0xFFC8E6C9),
      200: Color(0xFFA5D6A7),
      300: Color(0xFF81C784),
      400: Color(0xFF66BB6A),
      500: Color(_semanticGreenPrimaryValue),
      600: Color(0xFF43A047),
      700: Color(0xFF388E3C),
      800: Color(0xFF2E7D32),
      900: Color(0xFF1B5E20),
    },
  );
  static const int _semanticGreenPrimaryValue = 0xFF52D5BA;

  static const MaterialColor alertOrange = MaterialColor(
    // Alert Orange
    _semanticOrangePrimaryValue,
    <int, Color>{
      50: Color(0xFFFFF3E0),
      100: Color(0xFFFFE0B2),
      200: Color(0xFFFFCC80),
      300: Color(0xFFFFB74D),
      400: Color(0xFFFFA726),
      500: Color(_semanticOrangePrimaryValue),
      600: Color(0xFFFB8C00),
      700: Color(0xFFF57C00),
      800: Color(0xFFEF6C00),
      900: Color(0xFFE65100),
    },
  );
  static const int _semanticOrangePrimaryValue = 0xFFFB6B18;

  // Background Colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color lightGrey = Color(0xFFF5F5F5);

  // Text Colors
  static const Color black = Color(0xFF000000);
  static const Color darkGrey = Color(0xFF212121);

  // Error Colors
  static const Color error = Color(0xFFD32F2F);

  // Success Colors
  static const Color success = Color(0xFF388E3C);

  // Info Colors
  static const Color info = Color(0xFF03A9F4);
}
