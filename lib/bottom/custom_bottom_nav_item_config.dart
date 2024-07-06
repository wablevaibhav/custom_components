import 'package:custom_components/custom_components.dart';
import 'package:flutter/material.dart';

/// A <E> generic enum is required that exhaustively represents all the menu
/// options.
class CustomBottomNavItemConfig<E extends Enum> {
  /// [type] the enum type that is passed in via generic to this class. This
  /// enum defines a discreet number of button options so indexes dont need to
  /// be used. This helps with situations where the list of buttons could change
  /// dynamically.
  final Key? key;
  final E type;
  final IconData activeIcon;
  final Color activeIconColor;
  final Color backgroundColor;
  final Color badgeColor;
  final String? badgeText;
  final Color badgeTextColor;
  final Color circleActiveColor;
  final Color circleInactiveColor;
  final double iconSize;
  final IconData? inactiveIcon;
  final Color inactiveIconColor;
  final bool isCircle;
  final Widget Function(bool isSelected)? customWidget;

  CustomBottomNavItemConfig({
    this.key,
    required this.type,
    required this.activeIcon,
    this.inactiveIcon,
    Color? activeColor,
    Color? badgeColor,
    Color? badgeTextColor,
    Color? circleActiveColor,
    Color? circleInactiveColor,
    Color? inactiveColor,
    Color? backgroundColor,
    this.badgeText,
    this.iconSize = 18.0,
    this.isCircle = false,
    this.customWidget,
  })  : activeIconColor = activeColor ?? CustomColors.warningPrimary,
        inactiveIconColor = inactiveColor ?? CustomColors.gray,
        backgroundColor = backgroundColor ?? CustomColors.white,
        badgeColor = badgeColor ?? CustomColors.gray,
        badgeTextColor = badgeTextColor ?? CustomColors.white,
        circleActiveColor = circleActiveColor ?? CustomColors.warningPrimary,
        circleInactiveColor = circleInactiveColor ?? CustomColors.gray;
}
