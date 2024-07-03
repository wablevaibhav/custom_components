import 'package:custom_components/custom_components.dart';
import 'package:flutter/material.dart';

enum ButtonType {
  primary,
  primaryOutline,
  primaryText,
  dark,
  darkOutline,
  darkText,
}

extension StyleExtension on ButtonType {
  ColorConfig get buttonTheme {
    switch (this) {
      case ButtonType.primary:
        return ColorConfig(
            textColor: Colors.white,
            buttonStyle: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              backgroundColor: CustomColors.bluePrimary,
            ));
      case ButtonType.primaryOutline:
        return ColorConfig(
            textColor: CustomColors.bluePrimary,
            buttonStyle: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              elevation: 0,
              side: const BorderSide(color: CustomColors.bluePrimary),
              backgroundColor: Colors.transparent,
            ));
      case ButtonType.primaryText:
        return ColorConfig(
            buttonStyle: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                foregroundColor: Colors.transparent,
                elevation: 0,
                backgroundColor: Colors.transparent),
            textColor: CustomColors.bluePrimary);
      case ButtonType.dark:
        return ColorConfig(
            buttonStyle: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                backgroundColor: CustomColors.black),
            textColor: Colors.white);
      case ButtonType.darkOutline:
        return ColorConfig(
            buttonStyle: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                side: const BorderSide(
                  color: CustomColors.black,
                ),
                backgroundColor: Colors.transparent,
                elevation: 0),
            textColor: CustomColors.black);
      case ButtonType.darkText:
        return ColorConfig(
            buttonStyle: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                foregroundColor: Colors.transparent,
                elevation: 0,
                backgroundColor: Colors.transparent),
            textColor: CustomColors.black);
    }
  }
}

class ColorConfig {
  final Color textColor;
  final ButtonStyle buttonStyle;

  ColorConfig({
    required this.textColor,
    required this.buttonStyle,
  });
}
