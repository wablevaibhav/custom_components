import 'package:custom_components/custom_components.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

/// ExpNavMenu Must be declared with an <E> enum that represents all the
/// possible button options. This makes it easier to make the menu dynamic
/// whereas if we used an index instead we have to match
/// indexes to buttons.
class CustomTopNavMenu<E extends Enum> extends StatefulWidget {
  const CustomTopNavMenu({
    super.key = const Key('CustomTopNavMenu'),
    required this.items,
    this.nonSelectableItems,
    this.otherItemList,
    required this.onItemChangedListener,
    required this.initialItem,
    this.backgroundColor = CustomColors.bluePrimary,
    this.itemSpacing = 3.0,
    this.isExpanded = true,
    this.padding = const EdgeInsets.all(0),
  });

  /// List of menu item configurations
  final List<CustomTopNavItemConfig<E>> items;
  final List<CustomTopNavItemConfig<E>>? otherItemList;

  /// Callback when selecting an item
  final ValueChanged<E> onItemChangedListener;

  /// Enum of initially selected item
  final E initialItem;

  /// Non selectable enums which will activate but will not be marked as selected
  final List<E>? nonSelectableItems;

  /// Background color of menu
  final Color backgroundColor;

  /// Space applied between items
  final double itemSpacing;

  /// Whether to wrap in Expanded widget
  final bool isExpanded;

  /// Padding added to entire menu
  final EdgeInsets padding;

  @override
  _CustomTopNavMenuState createState() => _CustomTopNavMenuState<E>();
}

class _CustomTopNavMenuState<E extends Enum>
    extends State<CustomTopNavMenu<E>> {
  final EdgeInsets _headerPadding = const EdgeInsets.symmetric(vertical: 30);

  @override
  initState() {
    _selectedItem = widget.initialItem;
    super.initState();
  }

  late E _selectedItem;

  @override
  Widget build(BuildContext context) {
    if (widget.isExpanded) {
      return Expanded(
        child: _menu(),
      );
    }

    return _menu();
  }

  Widget _menu() {
    List<Widget> _widgets = [];
    _widgets.add(_headerImage());

    _widgets.addAll(_menuList(items: widget.items));
    if (widget.otherItemList?.isNotEmpty == true) {
      _widgets.add(_listDivider());
      _widgets.addAll(_menuList(items: widget.otherItemList ?? []));
    }

    return Container(
      padding: widget.padding,
      color: widget.backgroundColor,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _widgets,
        ),
      ),
    );
  }

  Widget _headerImage() {
    return Container(
      decoration: const BoxDecoration(
          border:
              Border(bottom: BorderSide(color: CustomColors.white, width: 1))),
      alignment: Alignment.centerLeft,
      padding: _headerPadding,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 10,
          top: 20,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image.asset(
            //   'assets/images/logo.png',
            //   width: 95.41,
            //   //color: CustomColors.white,
            //   height: 37.0,
            //   package: 'custom_components',
            // ),
            Icon(Iconsax.people, color: CustomColors.white),
            Gap(10),
            Text('Custom Components',
                style: CustomTextStyle.subHeadingH6
                    .copyWith(color: CustomColors.white)),
          ],
        ),
      ),
    );
  }

  Widget _listDivider() {
    return const Divider(
      color: CustomColors.white,
      thickness: 1.5,
      indent: 24,
      endIndent: 24,
    );
  }

  List<Widget> _menuList({required List<CustomTopNavItemConfig<E>> items}) {
    List<Widget> navItems = [];
    for (var config in items) {
      final isSelected = config.type == _selectedItem;
      navItems.add(
        Column(children: [
          CustomTopNavItem<E>(
            isSelected: isSelected,
            config: config,
            onItemChangedListener: _onItemTapped,
          ),
          Gap(widget.itemSpacing),
        ]),
      );
    }
    return navItems;
  }

  void _onItemTapped(E item) {
    var tempItem = item;
    if (widget.nonSelectableItems != null) {
      if (widget.nonSelectableItems!.contains(item)) {
        tempItem = _selectedItem;
      }
    }
    setState(() {
      _selectedItem = tempItem;
    });
    widget.onItemChangedListener(item);
  }
}
