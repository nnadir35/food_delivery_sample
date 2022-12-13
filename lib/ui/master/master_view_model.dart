import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:food_delivery_test/enum/preference_keys.dart';
import 'package:food_delivery_test/manager/locale_storage_manager.dart';
import 'package:food_delivery_test/models/meal_detail_model.dart';
import 'package:stacked/stacked.dart';

class MasterViewModel extends BaseViewModel {
  BuildContext viewModelContext;
  MasterViewModel(BuildContext context) {
    viewModelContext = context;
  }
  Future<void> init() async {
    var basketList =
        await LocalStorageManager.instance.getData(PreferencesKeys.basket);
    basketList.forEach((element) {
      SpecifiedMeal meal = SpecifiedMeal.fromJson(jsonDecode(element));
      addBasketItemIDList(meal.idMeal);
      addBasket(meal);
    });
  }

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

  List<String> _basketItemIDs = [];
  List<String> get basketItemIDs => _basketItemIDs;
  List<SpecifiedMeal> _basketItems = [];
  List<SpecifiedMeal> get getBasketItems => _basketItems;

  addBasketToggle(SpecifiedMeal value) async {
    List<String> specifiedJsonList = [];
    if (_basketItemIDs.contains(value.idMeal)) {
      _basketItemIDs.remove(value.idMeal);
      removeFromBasket(value);
      _basketItems.forEach((element) {
        specifiedJsonList.add(jsonEncode(element));
      });
      await LocalStorageManager.instance
          .insertData(PreferencesKeys.basket, specifiedJsonList);
    } else {
      addBasketItemIDList(value.idMeal);
      addBasket(value);
      _basketItems.forEach((element) {
        specifiedJsonList.add(jsonEncode(element));
      });
      await LocalStorageManager.instance
          .insertData(PreferencesKeys.basket, specifiedJsonList);
    }
    notifyListeners();
  }

  removeFromBasket(SpecifiedMeal value) {
    SpecifiedMeal toBeDeleted;
    _basketItems.forEach((item) {
      if (item.idMeal == value.idMeal) {
        toBeDeleted = item;
      }
    });
    _basketItems.remove(toBeDeleted);
    notifyListeners();
  }

  addBasket(SpecifiedMeal value) => _basketItems.add(value);
  addBasketItemIDList(String value) => _basketItemIDs.add(value);

  bool isInBasket(String value) => basketItemIDs.contains(value);
}
