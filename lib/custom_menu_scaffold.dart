import 'package:custom_components/custom_components.dart';
import 'package:flutter/material.dart';

/// ExpMenuScaffold Must be declared with an <E> enum. This makes it easier to make
/// the menu dynamic whereas if we used an index instead we have to match
/// indexes to buttons. This type will be passed down to its parameters.
class CustomMenuScaffold<E extends Enum> extends StatefulWidget {
  /// The maximum width of the drawer menu
  final double maxMenuWidth;

  /// The color of the menu icon
  final Color menuIconColor;

  /// The size of the menu icon
  final double menuIconSize;

  /// The body of the Scaffold
  final Widget body;

  /// Callback when menu item is selected
  final ValueChanged<E> onMenuItemSelected;

  /// The Top items
  final List<CustomTopNavItemConfig<E>> topItems;

  /// Initial menu selected enum
  final E initialItem;

  /// AppBar actions
  final List<Widget>? actions;

  /// Padding passed to ExpNavMenu
  final EdgeInsets menuPadding;

  /// The height of the AppBar.toolbarHeight
  final double? appBarHeight;

  const CustomMenuScaffold({
    super.key,
    this.menuIconSize = 24.0,
    required this.maxMenuWidth,
    required this.body,
    Color? menuIconColor,
    required this.onMenuItemSelected,
    required this.topItems,
    required this.initialItem,
    this.actions,
    this.menuPadding = const EdgeInsets.all(0),
    this.appBarHeight = kToolbarHeight,
  }) : menuIconColor = menuIconColor ?? CustomColors.white;

  @override
  State<CustomMenuScaffold> createState() => _CustomMenuScaffoldState<E>();
}

class _CustomMenuScaffoldState<E extends Enum>
    extends State<CustomMenuScaffold<E>> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  E? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      onDrawerChanged: (isOpen) {
        if (!isOpen && selectedItem != null) {
          widget.onMenuItemSelected(selectedItem!);
        }
      },
      drawer: drawer(),
      appBar: appBar(context),
      body: widget.body,
    );
  }

  Widget drawer() {
    return GestureDetector(
      onTap: () => {Navigator.pop(context)},
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: widget.maxMenuWidth),
        child: Column(
          children: [
            CustomTopNavMenu<E>(
              padding: widget.menuPadding,
              initialItem: widget.initialItem,
              onItemChangedListener: (item) {
                selectedItem = item;
                Navigator.pop(context, item);
              },
              items: widget.topItems,
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget appBar(BuildContext context) {
    return AppBar(
      toolbarHeight: widget.appBarHeight,
      actions: widget.actions,
      backgroundColor: CustomColors.black,
      leading: IconButton(
        icon: Icon(
          CustomIcons.menu,
          size: widget.menuIconSize,
          color: widget.menuIconColor,
        ),
        onPressed: () {
          selectedItem = null;
          _scaffoldKey.currentState?.openDrawer();
        },
      ),
    );
  }
}
