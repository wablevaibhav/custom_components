import 'package:custom_components/custom_components.dart';
import 'package:flutter/material.dart';

class CustomFailureWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String title = 'Oops!';
  final String message = 'Something went wrong. Please try again later.';

  const CustomFailureWidget({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CustomAlert.style(
        style: CustomAlertStyle.danger,
        title: title,
        message: message,
      ),
    );
  }
}
