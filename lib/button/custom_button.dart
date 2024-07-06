import 'package:custom_components/button/button_config.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
export 'button_config.dart';
export 'custom_button_icon.dart';

class CustomButton extends StatelessWidget {
  final ButtonType buttonType;
  final String text;
  final VoidCallback onPressed;
  final EdgeInsets? padding;
  final double? fontSize;
  final double? iconSize;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final TextDecoration? textDecoration;
  final TextStyle? textStyle;

  const CustomButton({
    super.key,
    ButtonType? buttonType,
    required this.text,
    required this.onPressed,
    this.padding,
    this.fontSize,
    this.iconSize,
    this.leadingIcon,
    this.trailingIcon,
    this.textDecoration,
    this.textStyle,
  }) : buttonType = buttonType ?? ButtonType.primary;

  @override
  Widget build(BuildContext context) {
    if (buttonType == ButtonType.primaryText ||
        buttonType == ButtonType.darkText) {
      return InkWell(
        onTap: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (leadingIcon != null)
              Icon(leadingIcon,
                  size: iconSize ?? 13,
                  color: buttonType.buttonTheme.textColor),
            const Gap(5),
            Text(
              text,
              overflow: TextOverflow.ellipsis,
              style: textStyle ??
                  TextStyle(
                    decoration: textDecoration ?? TextDecoration.none,
                    decorationColor: buttonType.buttonTheme.textColor,
                    color: buttonType.buttonTheme.textColor,
                    fontSize: fontSize ?? 16,
                    fontWeight: FontWeight.w400,
                  ),
            )
          ],
        ),
      );
    } else {
      return ElevatedButton(
        key: key,
        onPressed: onPressed,
        style: buttonType.buttonTheme.buttonStyle,
        child: Padding(
          padding: padding ?? const EdgeInsets.all(0.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (leadingIcon != null)
                Icon(
                  leadingIcon,
                  size: iconSize ?? 13,
                  color: buttonType.buttonTheme.textColor,
                ),
              const Gap(5),
              Text(
                text,
                overflow: TextOverflow.ellipsis,
                style: textStyle ??
                    TextStyle(
                      color: buttonType.buttonTheme.textColor,
                      fontSize: fontSize ?? 16,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              const Gap(5),
              if (trailingIcon != null)
                Icon(trailingIcon,
                    color: buttonType.buttonTheme.textColor,
                    size: iconSize ?? 13),
            ],
          ),
        ),
      );
    }
  }
}
