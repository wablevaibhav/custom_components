import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomButtonIcon extends StatelessWidget {
  final Color iconColor;
  final IconData icon;
  final VoidCallback? onPressed;
  final double size;

  const CustomButtonIcon({
    super.key,
    required this.icon,
    required this.onPressed,
    this.iconColor = const Color(0xFF303030),
    this.size = 18.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: GestureDetector(
        onTap: onPressed,
        child: Icon(
          icon,
          color: iconColor,
          size: size,
        ),
      ),
    );
  }
}
