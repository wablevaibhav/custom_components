import 'package:custom_components/custom_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextInput extends StatelessWidget {
  final String? hint;
  final String? label;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final TextStyle? style;
  final Color? cursorColor;
  final bool? showCursor;
  final bool? obscureText;
  final bool? autoCorrect;
  final bool? enableSuggestions;
  final Key? textFieldKey;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onSubmittedAction;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle? labelTextStyle;
  final String? Function(String?)? validator;
  final bool? enabled;
  final int? maxLength;
  final int? maxLines;
  final Color? color;

  const CustomTextInput({
    super.key,
    this.textFieldKey,
    required this.hint,
    required this.label,
    this.controller,
    this.focusNode,
    this.style,
    this.cursorColor,
    this.showCursor,
    this.obscureText,
    this.autoCorrect,
    this.enableSuggestions,
    this.textInputAction,
    this.onSubmittedAction,
    this.enabled = true,
    this.suffixIcon,
    this.inputFormatters,
    this.labelTextStyle,
    this.validator,
    this.maxLength,
    this.maxLines,
    this.color = CustomColors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(
          primaryColor: color,
        ),
        child: Material(
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            enabled: enabled,
            validator: validator,
            textInputAction: textInputAction,
            key: textFieldKey,
            focusNode: focusNode,
            controller: controller,
            style: CustomTextStyle.button,
            showCursor: showCursor ?? true,
            maxLength: maxLength,
            maxLines: maxLines ?? 1,
            cursorColor: cursorColor ?? CustomColors.black,
            decoration: inputDecoration(hint, suffixIcon),
            obscureText: obscureText ?? false,
            autocorrect: autoCorrect ?? false,
            enableSuggestions: enableSuggestions ?? false,
            inputFormatters: inputFormatters,
          ),
        ));
  }

  InputDecoration inputDecoration(String? hint, Widget? suffixIcon,
      {double borderRadius = 5,
      bool borderEnabled = true,
      bool isDense = false,
      EdgeInsets contentPadding = const EdgeInsets.fromLTRB(16, 10, 16, 10)}) {
    return InputDecoration(
      label: Text(
        label ?? '',
        style: labelTextStyle ??
            CustomTextStyle.bodyText2.copyWith(
                fontWeight: FontWeight.w400,
                color: color ?? CustomColors.black),
      ),
      fillColor: CustomColors.disable,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      filled: !enabled!,
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        borderSide: const BorderSide(color: CustomColors.danger),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        borderSide: const BorderSide(color: CustomColors.danger),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        borderSide: const BorderSide(color: CustomColors.disable),
      ),
      focusColor: CustomColors.black,
      hintStyle: CustomTextStyle.bodyText2.copyWith(
          color: const Color.fromARGB(255, 133, 135, 145),
          fontWeight: FontWeight.w400),
      hoverColor: CustomColors.black,
      floatingLabelStyle: CustomTextStyle.bodyText1.copyWith(
          color: CustomColors.black, fontSize: 12, fontWeight: FontWeight.w500),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        borderSide: BorderSide(width: 1, color: color ?? CustomColors.black),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: color ?? CustomColors.black,
        ),
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      ),
      contentPadding: contentPadding,
      hintText: hint ?? '',
      isDense: isDense,
      suffixIcon: suffixIcon,
    );
  }
}
