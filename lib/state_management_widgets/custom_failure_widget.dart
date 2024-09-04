import 'package:custom_components/custom_components.dart';
import 'package:flutter/material.dart';

class CustomFailureWidget extends StatelessWidget {
  const CustomFailureWidget({
    super.key,
    required this.onTap,
    this.title,
    this.message,
  });

  final String? message;
  final VoidCallback onTap;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CustomAlert.style(
        style: CustomAlertStyle.danger,
        title: title ?? 'Oops!',
        message: message ?? 'Something went wrong. Please try again later.',
      ),
    );
  }
}
