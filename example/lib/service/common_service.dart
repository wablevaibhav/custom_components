import 'package:flutter/material.dart';

class CommonService extends ChangeNotifier {
  int? _selectedMenuIndex = 0;
  int? get selectedMenuIndex => _selectedMenuIndex;

  setSelectedMenuIndex(int? index, {bool notify = true}) {
    _selectedMenuIndex = index;
    if (notify) notifyListeners();
  }
}
