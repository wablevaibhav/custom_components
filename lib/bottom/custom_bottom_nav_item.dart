import 'package:custom_components/custom_components.dart';
import 'package:flutter/material.dart';

/// A <E> generic enum is required that exhaustively represents all the menu
/// options.
class CustomBottomNavItem<E extends Enum> extends StatelessWidget {
  final double barHeight;
  final double _circleSize = 56.0;
  final double _circleBottomOffset = 11.0;
  final CustomBottomNavItemConfig config;
  final bool isSelected;
  final VoidCallback onItemChangedListener;

  CustomBottomNavItem({
    required this.barHeight,
    required this.config,
    required this.isSelected,
    required this.onItemChangedListener,
  }) : super(key: config.key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onItemChangedListener,
        child: _content(),
      ),
    );
  }

  Widget _content() {
    if (config.isCircle) {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          // Mask layer
          Positioned.fill(
            child: Container(
              color: CustomColors.bluePrimary,
              height: _circleBottomOffset,
            ),
          ),
          // Circle
          Positioned.fill(
            child: SizedBox(
              height: double.infinity,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: _circleSize,
                  height: _circleSize,
                  child: _icon(),
                ),
              ),
            ),
          ),
        ],
      );
    }

    return Container(
      height: double.infinity,
      color: CustomColors.blueSecondary,
      child: (config.isCircle) ? Container() : _icon(),
    );
  }

  Widget _icon() {
    if (config.customWidget != null) {
      return config.customWidget!(isSelected);
    }
    if (isSelected) return _selectedIcon();
    return _unselectedIcon();
  }

  Widget _selectedIcon() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.center,
          child: Icon(
            config.activeIcon,
            color: CustomColors.white,
            size: 20,
          ),
        ),
        if (config.badgeText != null)
          Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Text(config.badgeText ?? "",
                overflow: TextOverflow.ellipsis,
                style: CustomTextStyle.hint
                    .copyWith(color: CustomColors.white, fontSize: 10)),
          )
      ],
    );
  }

  Widget _unselectedIcon() {
    final icon = config.inactiveIcon ?? config.activeIcon;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.center,
          child: Icon(
            icon,
            size: 18,
            color: CustomColors.gray,
          ),
        ),
        if (config.badgeText != null)
          Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Text(config.badgeText ?? "",
                overflow: TextOverflow.ellipsis,
                style: CustomTextStyle.hint
                    .copyWith(color: CustomColors.white, fontSize: 10)),
          )
      ],
    );
  }
}
