import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBarTheme {
  CustomAppBarTheme._();

  // Light AppBar Theme
  static final lightAppBarTheme = AppBarTheme(
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    iconTheme: const IconThemeData(
      color: Colors.black,
      size: 24,
    ),
    actionsIconTheme: const IconThemeData(
      color: Colors.black,
      size: 24,
    ),
    titleTextStyle: GoogleFonts.poppins(
      fontSize: 18.0,
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ),
  );

  // Dark App Bar Theme
  static final darkAppBarTheme = AppBarTheme(
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    iconTheme: const IconThemeData(
      color: Colors.black,
      size: 24,
    ),
    actionsIconTheme: const IconThemeData(
      color: Colors.white,
      size: 24,
    ),
    titleTextStyle: GoogleFonts.poppins(
      fontSize: 18.0,
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),
  );
}
