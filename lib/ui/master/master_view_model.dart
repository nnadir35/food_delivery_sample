import 'dart:convert';

import 'package:flutter/cupertino.dart';
import '../../enum/preference_keys.dart';
import '../../manager/locale_storage_manager.dart';
import '../../models/meal_detail_model.dart';
import 'package:stacked/stacked.dart';

class MasterViewModel extends BaseViewModel {
  BuildContext viewModelContext;
  MasterViewModel(BuildContext context) {
    viewModelContext = context;
  }
  Future<void> init() async {}

  SpecifiedMeal _selectedBasketItem;
  SpecifiedMeal get selectedBasketItem => _selectedBasketItem;
  set setSelectedBasketItem(SpecifiedMeal s) {
    _selectedBasketItem = s;
    notifyListeners();
  }

  String _selectedMealName = "";
  get selectedMealName => _selectedMealName;
  set setSelectedMealName(String s) {
    _selectedMealName = s;
    notifyListeners();
  }
}
