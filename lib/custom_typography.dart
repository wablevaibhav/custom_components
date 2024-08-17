import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextStyle {
  const CustomTextStyle._();

  static const Color fontColor = Colors.black;
  static const Color fontHintColor = Colors.grey;
  static const FontWeight fontWeight = FontWeight.normal;

  // HEADINGS
  static final TextStyle heading1 = GoogleFonts.poppins(
    fontSize: 48.0,
    letterSpacing: 0.5,
    height: 1.2,
    color: fontColor,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle heading2 = GoogleFonts.poppins(
    fontSize: 40.0,
    letterSpacing: 0.4,
    height: 1.2,
    color: fontColor,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle heading3 = GoogleFonts.poppins(
    fontSize: 32.0,
    letterSpacing: 0.3,
    height: 1.2,
    color: fontColor,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle heading4 = GoogleFonts.poppins(
    fontSize: 28.0,
    letterSpacing: 0.25,
    height: 1.2,
    color: fontColor,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle heading5 = GoogleFonts.poppins(
    fontSize: 24.0,
    letterSpacing: 0.2,
    height: 1.2,
    color: fontColor,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle heading6 = GoogleFonts.poppins(
    fontSize: 20.0,
    letterSpacing: 0.15,
    height: 1.2,
    color: fontColor,
    fontWeight: FontWeight.bold,
  );

  // SUBTITLES
  static final TextStyle subtitle1 = GoogleFonts.poppins(
    fontSize: 16.0,
    letterSpacing: 0.15,
    height: 1.2,
    color: fontColor,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle subtitle2 = GoogleFonts.poppins(
    fontSize: 14.0,
    letterSpacing: 0.1,
    height: 1.2,
    color: fontColor,
    fontWeight: FontWeight.w500,
  );

  // BODY TEXT
  static final TextStyle bodyText1 = GoogleFonts.poppins(
    fontSize: 16.0,
    letterSpacing: 0.5,
    height: 1.5,
    color: fontColor,
    fontWeight: fontWeight,
  );

  static final TextStyle bodyText2 = GoogleFonts.poppins(
    fontSize: 14.0,
    letterSpacing: 0.25,
    height: 1.5,
    color: fontColor,
    fontWeight: fontWeight,
  );

  // CAPTIONS
  static final TextStyle caption = GoogleFonts.poppins(
    fontSize: 12.0,
    letterSpacing: 0.4,
    height: 1.2,
    color: fontColor,
    fontWeight: fontWeight,
  );

  // BUTTONS
  static final TextStyle button = GoogleFonts.poppins(
    fontSize: 14.0,
    letterSpacing: 1.25,
    height: 1.2,
    color: fontColor,
    fontWeight: FontWeight.w600,
  );

  // OVERLINES
  static final TextStyle overline = GoogleFonts.poppins(
    fontSize: 10.0,
    letterSpacing: 1.5,
    height: 1.2,
    color: fontColor,
    fontWeight: fontWeight,
  );

  // HINT TEXT
  static final TextStyle hint = GoogleFonts.poppins(
    fontSize: 14.0,
    letterSpacing: 0.5,
    height: 1.2,
    color: fontHintColor,
    fontWeight: fontWeight,
  );

  // UNDERLINE TEXT
  static final TextStyle underline = GoogleFonts.poppins(
    fontSize: 14.0,
    letterSpacing: 0.5,
    height: 1.2,
    color: fontColor,
    decoration: TextDecoration.underline,
    fontWeight: fontWeight,
  );
}

extension CustomTextStyleExtension on TextStyle {
  TextStyle light300() {
    return copyWith(fontWeight: FontWeight.w300);
  }

  TextStyle regularItalic() {
    return copyWith(
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.normal,
    );
  }

  TextStyle medium500() {
    return copyWith(fontWeight: FontWeight.w500);
  }

  TextStyle bold600() {
    return copyWith(fontWeight: FontWeight.w600);
  }

  TextStyle bold700() {
    return copyWith(fontWeight: FontWeight.w700);
  }

  TextStyle black900() {
    return copyWith(fontWeight: FontWeight.w900);
  }

  TextStyle withColor(Color color) {
    return copyWith(color: color);
  }

  TextStyle withUnderline() {
    return copyWith(decoration: TextDecoration.underline);
  }
}
