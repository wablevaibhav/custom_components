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
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label ?? '',
          style: labelTextStyle ??
              CustomTextStyle.small.copyWith(
                  fontWeight: FontWeight.w400, color: CustomColors.black),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 40,
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
            minLines: 1,
            cursorColor: CustomColors.gray.shade900,
            decoration: inputDecoration(hint, suffixIcon),
            obscureText: obscureText ?? false,
            autocorrect: autoCorrect ?? false,
            enableSuggestions: enableSuggestions ?? false,
            inputFormatters: inputFormatters,
          ),
        ),
      ],
    );
  }

  InputDecoration inputDecoration(String? hint, Widget? suffixIcon,
      {double borderRadius = 8,
      bool borderEnabled = true,
      bool isDense = false,
      EdgeInsets contentPadding = const EdgeInsets.fromLTRB(16, 10, 16, 10)}) {
    return InputDecoration(
      fillColor: CustomColors.disablePrimary.shade100,
      filled: !enabled!,
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        borderSide: BorderSide(width: 1, color: CustomColors.gray.shade900),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        borderSide:
            BorderSide(width: 0, color: CustomColors.disablePrimary.shade100),
      ),
      focusColor: CustomColors.gray.shade900,
      hintStyle: const TextStyle(
          color: Color.fromARGB(255, 133, 135, 145),
          fontWeight: FontWeight.w400),
      hoverColor: CustomColors.gray.shade900,
      floatingLabelStyle: TextStyle(
          color: CustomColors.gray.shade900,
          fontSize: 12,
          fontWeight: FontWeight.w500),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        borderSide: BorderSide(width: 1, color: CustomColors.gray.shade900),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: Color.fromARGB(255, 231, 231, 233),
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
