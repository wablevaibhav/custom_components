import 'package:custom_components/custom_components.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextStyle {
  const CustomTextStyle._();

  static const Color fontColor = CustomColors.black;
  static const Color fontHintColor = CustomColors.gray;
  static const FontWeight fontWeight = FontWeight.normal;

  // HEADING H1
  static final TextStyle headingH1 = GoogleFonts.poppins(
    fontSize: 48.0,
    letterSpacing: 0.42,
    height: 32.0 / 28.0,
    color: fontColor,
    fontWeight: fontWeight,
  );

  // HEADING H2
  static final TextStyle headingH2 = GoogleFonts.poppins(
    fontSize: 40.0,
    letterSpacing: 0.36,
    height: 32.0 / 24.0,
    color: fontColor,
    fontWeight: fontWeight,
  );

  // SUB-HEADING H3
  static final TextStyle subHeadingH3 = GoogleFonts.poppins(
    fontSize: 32.0,
    letterSpacing: 0.3,
    height: 26.0 / 20.0,
    color: fontColor,
    fontWeight: fontWeight,
  );

  // SUB-HEADING H4
  static final TextStyle subHeadingH4 = GoogleFonts.poppins(
    fontSize: 28.0,
    letterSpacing: 0.27,
    height: 24.0 / 18.0,
    color: fontColor,
    fontWeight: fontWeight,
  );

  // SUB-HEADING H5
  static final TextStyle subHeadingH5 = GoogleFonts.poppins(
    fontSize: 24.0,
    letterSpacing: 0.24,
    height: 21.0 / 16.0,
    color: fontColor,
    fontWeight: fontWeight,
  );

  // SUB-HEADING H6
  static final TextStyle subHeadingH6 = GoogleFonts.poppins(
    fontSize: 20.0,
    letterSpacing: 0.21,
    height: 20.0 / 16.0,
    color: fontColor,
    fontWeight: fontWeight,
  );

  // NORMAL
  static final TextStyle normal = GoogleFonts.poppins(
    fontSize: 18.0,
    letterSpacing: 0.24,
    height: 24.0 / 16.0,
    color: fontColor,
    fontWeight: fontWeight,
  );

  // SMALL
  static final TextStyle small = GoogleFonts.poppins(
    fontSize: 16.0,
    letterSpacing: 0.21,
    height: 21.0 / 14.0,
    color: fontColor,
    fontWeight: fontWeight,
  );

  // HINT
  static final TextStyle hint = GoogleFonts.poppins(
    fontSize: 14.0,
    letterSpacing: 0.21,
    height: 21.0 / 14.0,
    color: fontColor,
    fontWeight: fontWeight,
  );

  // MEDIUM HINT
  static final TextStyle mediumHint = GoogleFonts.poppins(
    fontSize: 12.0,
    letterSpacing: 0.27,
    height: 24.0 / 18.0,
    color: fontColor,
    fontWeight: fontWeight,
  );

  // SMALL HINT
  static final TextStyle smallHint = GoogleFonts.poppins(
    fontSize: 10.0,
    letterSpacing: 0.21,
    height: 21.0 / 14.0,
    color: fontColor,
    fontWeight: fontWeight,
  );

  // EXTRA LARGE UNDERLINE
  static final TextStyle extraLargeUnderline = GoogleFonts.poppins(
    decoration: TextDecoration.underline,
    fontSize: 20.0,
    letterSpacing: 0.21,
    height: 21.0 / 14.0,
    color: fontColor,
    fontWeight: fontWeight,
  );

  // LARGE UNDERLINE
  static final TextStyle largeUnderline = GoogleFonts.poppins(
    decoration: TextDecoration.underline,
    fontSize: 18.0,
    letterSpacing: 0.21,
    height: 21.0 / 14.0,
    color: fontColor,
    fontWeight: fontWeight,
  );

  // MEDIUM UNDERLINE
  static final TextStyle mediumUnderline = GoogleFonts.poppins(
    decoration: TextDecoration.underline,
    fontSize: 16.0,
    letterSpacing: 0.21,
    height: 21.0 / 14.0,
    color: fontColor,
    fontWeight: fontWeight,
  );

  // SMALL UNDERLINE
  static final TextStyle smallUnderline = GoogleFonts.poppins(
    fontSize: 14.0,
    letterSpacing: 0.21,
    height: 21.0 / 14.0,
    color: fontColor,
    fontWeight: fontWeight,
  );

  // EXTRA SMALL UNDERLINE
  static final TextStyle extraSmallUnderline = GoogleFonts.poppins(
    fontSize: 12.0,
    letterSpacing: 0.21,
    height: 21.0 / 14.0,
    color: fontColor,
    fontWeight: fontWeight,
  );

  // BUTTON
  static final TextStyle button = GoogleFonts.poppins(
    fontSize: 14.0,
    letterSpacing: 0.21,
    height: 21.0 / 14.0,
    color: fontColor,
    fontWeight: fontWeight,
  );

  // CAPTION
  static final TextStyle caption = GoogleFonts.poppins(
    fontSize: 12.0,
    letterSpacing: 0.18,
    height: 16.0 / 12.0,
    color: fontColor,
    fontWeight: fontWeight,
  );

  // DESCRIPTION
  static final TextStyle description = GoogleFonts.poppins(
    fontSize: 12.0,
    letterSpacing: 0.18,
    height: 16.0 / 12.0,
    color: fontColor,
    fontStyle: FontStyle.italic,
    fontWeight: fontWeight,
  );

  // REGULAR
  static final TextStyle regularTextStyle = GoogleFonts.poppins(
    fontSize: 16.0,
    letterSpacing: 0.4,
    height: 34.0 / 16.0,
    color: fontColor,
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

  TextStyle bold400() {
    return copyWith(fontWeight: FontWeight.w400);
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
}
