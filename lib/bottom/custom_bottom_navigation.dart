import 'package:custom_components/custom_components.dart';
import 'package:flutter/material.dart';

/// A <E> generic enum is required that exhaustively represents all the menu
/// options.
class CustomBottomNavBar<E extends Enum> extends StatefulWidget {
  const CustomBottomNavBar({
    super.key,
    required this.items,
    required this.initialIndex,
    required this.onItemChangedListener,
    this.bottomPadding = 0,
  });

  /// List of menu item configurations
  final List<CustomBottomNavItemConfig<E>> items;

  /// Callback when selecting an item
  final void Function(E, int) onItemChangedListener;

  /// Space below bar - useful for safe area issues
  final double bottomPadding;

  /// Index of initially selected item
  final E initialIndex;

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState<E>();
}

class _CustomBottomNavBarState<E extends Enum>
    extends State<CustomBottomNavBar<E>> {
  final Color _barBackgroundColor = CustomColors.bluePrimary;
  final double _barHeight = 65.0;
  final List<BoxShadow> boxShadows = const [
    BoxShadow(
      color: Colors.black12,
      offset: Offset(0, -1),
      blurRadius: 8,
    ),
  ];

  @override
  initState() {
    _selectedIndex = widget.initialIndex;
    super.initState();
  }

  late E _selectedIndex;

  @override
  Widget build(BuildContext context) {
    List<Widget> navItems = [];
    widget.items.asMap().forEach((index, config) {
      final isSelected = config.type == _selectedIndex;
      navItems.add(
        CustomBottomNavItem<E>(
          barHeight: _barHeight,
          config: config,
          isSelected: isSelected,
          onItemChangedListener: () {
            _onItemTapped(config.type, index);
          },
        ),
      );
    });

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(10.0),
        topRight: Radius.circular(10.0),
      ),
      child: SizedBox(
        height: widget.bottomPadding + _barHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: _barHeight,
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: _barHeight,
                    decoration: BoxDecoration(
                      color: CustomColors.blueSecondary,
                      boxShadow: boxShadows,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: navItems,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: widget.bottomPadding,
              color: _barBackgroundColor,
            ),
          ],
        ),
      ),
    );
  }

  /// [item] the enum type that represends this bottom nav item.
  /// [index] the index of the navItem in the nav bar. This is just used to
  /// check if the currently selected item is the navMenu or not. navIndex = (2)
  void _onItemTapped(E item, int index) {
    widget.onItemChangedListener(item, index);

    setState(() {
      _selectedIndex = item;
    });
  }
}
