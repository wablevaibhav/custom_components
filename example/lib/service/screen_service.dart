import 'package:example/screens/alert_dialog_screen.dart';
import 'package:example/screens/button_widget_screen.dart';
import 'package:example/screens/home_screen.dart';
import 'package:flutter/material.dart';

Widget getScreen(int? selectedIndex) {
  switch (selectedIndex) {
    case 0:
      return const HomeScreen();
    case 1:
      return const ButtonWidgetScreen();
    case 2:
      return const AlertDialogScreen();
    default:
      return Container();
  }
}
