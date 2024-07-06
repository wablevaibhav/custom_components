import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  static double mobileWidth = 650;
  static double tabletWidth = 1100;

  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const Responsive({
    required Key key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  }) : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < mobileWidth;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < tabletWidth &&
      MediaQuery.of(context).size.width >= mobileWidth;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= tabletWidth;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= tabletWidth) {
          return desktop;
        } else if (constraints.maxWidth >= mobileWidth) {
          return tablet;
        } else {
          return mobile;
        }
      },
    );
  }
}
