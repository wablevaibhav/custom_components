import "package:custom_components/custom_colors.dart";
import "package:custom_components/custom_typography.dart";
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
  final Color? color;

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
    this.isMenu = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: color ?? CustomColors.black,
      ),
      child: Material(
        child: DropdownSearch<String>(
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
                    return const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text("something went wrong"));
                  },
                  emptyBuilder: (context, searchEntry) {
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(emptyText ?? "No Data Found"),
                    );
                  },
                  fit: FlexFit.loose,
                  showSearchBox: showSearchBox)
              : PopupProps.dialog(
                  dialogProps: const DialogProps(
                      backgroundColor: Color.fromARGB(255, 239, 240, 243),
                      elevation: 8),
                  listViewProps: const ListViewProps(
                      dragStartBehavior: DragStartBehavior.down),
                  loadingBuilder: (context, searchEntry) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  errorBuilder: (context, searchEntry, exception) {
                    return const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text("something went wrong"));
                  },
                  emptyBuilder: (context, searchEntry) {
                    return const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text("No Data Found"),
                    );
                  },
                  fit: FlexFit.loose,
                  showSearchBox: showSearchBox),
          dropdownButtonProps: const DropdownButtonProps(),
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              label: Text(title ?? "",
                  style: style ??
                      CustomTextStyle.bodyText2.copyWith(
                          fontWeight: FontWeight.w400,
                          color: color ?? CustomColors.black)),
              contentPadding: const EdgeInsets.fromLTRB(8, 6, 8, 6),
              hintText: hintText ?? "Select",
              hintStyle: CustomTextStyle.bodyText2
                  .copyWith(color: CustomColors.disable),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: color ?? CustomColors.black)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: color ?? CustomColors.black)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: color ?? CustomColors.black)),
            ),
          ),
          items: items,
        ),
      ),
    );
  }
}
