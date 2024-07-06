import 'package:custom_components/custom_components.dart';
import 'package:flutter/material.dart';

/// A <E> generic enum is required that exhaustively represents all the menu
/// options.
class CustomTopNavItem<E extends Enum> extends StatelessWidget {
  final CustomTopNavItemConfig<E> config;
  final bool isSelected;
  final ValueChanged<E> onItemChangedListener;

  CustomTopNavItem({
    required this.config,
    this.isSelected = false,
    required this.onItemChangedListener,
  }) : super(key: config.key);

  @override
  Widget build(BuildContext context) {
    final Color? backgroundColor =
        (isSelected) ? config.activeColor : config.inactiveColor;
    return GestureDetector(
      onTap: () {
        onItemChangedListener(config.type);
      },
      child: Container(
        height: config.height,
        padding: config.padding,
        child: Container(
          padding: config.contentPadding,
          decoration: BoxDecoration(
            gradient: isSelected
                ? const LinearGradient(colors: [
                    Color.fromRGBO(61, 63, 80, 1),
                    Color.fromRGBO(133, 135, 145, 1)
                  ], stops: [
                    0.001,
                    0.9,
                  ])
                : null,
            color: isSelected ? backgroundColor : null,
            borderRadius: config.borderRadius,
          ),
          child: Row(
            children: _contentItems(),
          ),
        ),
      ),
    );
  }

  List<Widget> _contentItems() {
    const Color contentColor = CustomColors.gray;

    if (config.iconData == null) {
      return [_text(contentColor)];
    }

    return [
      Icon(
        config.iconData,
        color: contentColor,
        size: config.iconSize,
      ),
      SizedBox(width: config.contentSpacing),
      Expanded(
        child: _text(contentColor),
      ),
    ];
  }

  Widget _text(Color color) {
    return Text(
      config.title,
      style: CustomTextStyle.subHeadingH6.copyWith(
        fontWeight: FontWeight.w500,
        color: color,
        height: null,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }
}
