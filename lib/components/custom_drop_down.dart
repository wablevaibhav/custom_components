import "package:dropdown_search/dropdown_search.dart";
import "package:flutter/gestures.dart";
import "package:flutter/material.dart";

class CustomSearchDropdown extends StatelessWidget {
  final List<String> items;
  final String? selectedValue;
  final void Function(String?)? onChanged;
  final void Function(String?)? onSaved;

  final bool? isMenu;

  final bool? isEnable;
  final bool showSearchBox;
  final String? emptyText;
  final String? title;
  final String? Function(String?)? validator;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final String? hintText;
  final double radius;

  const CustomSearchDropdown({
    super.key,
    required this.items,
    this.title,
    this.style,
    this.selectedValue,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.isEnable = true,
    this.emptyText,
    this.hintText,
    this.hintStyle,
    required this.showSearchBox,
    this.isMenu = true,
    this.radius = 2,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      validator: validator,
      enabled: isEnable ?? true,
      selectedItem: selectedValue,
      onChanged: onChanged,
      popupProps: isMenu == true
          ? PopupProps.menu(
              listViewProps: const ListViewProps(
                  dragStartBehavior: DragStartBehavior.down),
              loadingBuilder: (context, searchEntry) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
              errorBuilder: (context, searchEntry, exception) {
                return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "something went wrong",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ));
              },
              emptyBuilder: (context, searchEntry) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    emptyText ?? "No Data Found",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                );
              },
              fit: FlexFit.loose,
              showSearchBox: showSearchBox)
          : PopupProps.dialog(
              dialogProps: DialogProps(
                  backgroundColor: Theme.of(context).cardColor, elevation: 8),
              listViewProps: const ListViewProps(
                  dragStartBehavior: DragStartBehavior.down),
              loadingBuilder: (context, searchEntry) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
              errorBuilder: (context, searchEntry, exception) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "something went wrong",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                );
              },
              emptyBuilder: (context, searchEntry) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "No Data Found",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                );
              },
              fit: FlexFit.loose,
              showSearchBox: showSearchBox),
      dropdownButtonProps: const DropdownButtonProps(),
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          label: Text(title ?? "",
              style: style ?? Theme.of(context).textTheme.bodyMedium),
          contentPadding: const EdgeInsets.fromLTRB(8, 6, 8, 6),
          hintText: hintText ?? "Select",
          hintStyle: hintStyle ?? Theme.of(context).textTheme.bodyMedium,
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: const BorderSide(color: Colors.red),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: Theme.of(context).highlightColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: Theme.of(context).primaryColor)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius),
              borderSide: BorderSide(color: Theme.of(context).highlightColor)),
        ),
      ),
      items: items,
    );
  }
}
