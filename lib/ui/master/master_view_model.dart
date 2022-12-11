import 'dart:math';

import 'package:stacked/stacked.dart';

class MasterViewModel extends BaseViewModel {
  Future<void> init() async {}

  String _selectedCategoryName = "";
  get selectedCategoryName => _selectedCategoryName;
  set setSelectedCategoryName(String s) {
    _selectedCategoryName = s;
    notifyListeners();
  }
}
