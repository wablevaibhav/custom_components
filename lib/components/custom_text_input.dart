import 'package:flutter/material.dart';

class CustomTextInput extends StatelessWidget {
  const CustomTextInput({
    super.key,
    this.labelText,
    this.hintText,
    this.controller,
    this.keyboardType,
    this.style,
    this.labelStyle,
    this.hintStyle,
    this.enabled = true,
    this.readOnly = false,
    this.suffixIcon,
    this.prefixIcon,
    this.constraints = const BoxConstraints(minHeight: 50),
    this.maxLength,
    this.maxLines,
    this.radius = 2,
    this.floatingLabelBehavior = FloatingLabelBehavior.always,
    this.focusNode,
    this.onTap,
    this.onFieldSubmitted,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 10),
  });

  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextStyle? style;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final bool enabled;
  final bool readOnly;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final BoxConstraints constraints;
  final int? maxLength;
  final int? maxLines;
  final double radius;
  final FloatingLabelBehavior floatingLabelBehavior;
  final FocusNode? focusNode;
  final Function()? onTap;
  final Function(String)? onFieldSubmitted;
  final EdgeInsets contentPadding;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      onFieldSubmitted: onFieldSubmitted,
      controller: controller,
      keyboardType: keyboardType,
      style: style ?? Theme.of(context).textTheme.bodyMedium,
      readOnly: readOnly,
      minLines: 1,
      maxLength: maxLength,
      maxLines: maxLines,
      focusNode: focusNode,
      cursorColor: Theme.of(context).primaryColor,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        fillColor: Theme.of(context).cardColor,
        filled: !enabled,
        constraints: constraints,
        labelText: labelText,
        labelStyle: labelStyle ?? Theme.of(context).textTheme.bodyMedium,
        hintText: hintText,
        hintStyle: hintStyle ??
            Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Theme.of(context).disabledColor),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        floatingLabelBehavior: floatingLabelBehavior,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        enabled: enabled,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(color: Theme.of(context).disabledColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: const BorderSide(color: Colors.red),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(color: Theme.of(context).highlightColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
