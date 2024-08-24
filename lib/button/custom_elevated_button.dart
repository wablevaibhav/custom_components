import 'package:custom_components/custom_components.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    this.backgroundColor,
    this.borderColor,
    required this.title,
    this.iconData,
    this.iconColor,
    this.width,
    this.height,
    this.radius,
    this.textColor,
    this.textStyle,
  });

  final void Function()? onPressed;
  final Color? backgroundColor;
  final Color? borderColor;
  final String title;
  final Color? textColor;
  final TextStyle? textStyle;
  final IconData? iconData;
  final Color? iconColor;
  final double? width;
  final double? height;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: iconData == null
          ? Container()
          : Icon(
              iconData,
              color: iconColor ?? Theme.of(context).cardColor,
            ),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 5),
          side: BorderSide(
            color: borderColor ?? Theme.of(context).primaryColor,
          ),
        ),
        fixedSize:
            Size(width ?? UIHelpers.screenWidth(context) * 1.0, height ?? 50),
      ),
      label: Text(title,
          style: textStyle ??
              Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: textColor ?? Theme.of(context).cardColor)),
    );
  }
}
