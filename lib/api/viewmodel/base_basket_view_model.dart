import 'dart:convert';

import 'package:stacked/stacked.dart';

import '../../enum/preference_keys.dart';
import '../../manager/locale_storage_manager.dart';
import '../../models/meal_detail_model.dart';

class BaseBasketViewModel extends BaseViewModel {
  BaseBasketViewModel() {
    init();
  }

  init() async {
    var basketList =
        await LocalStorageManager.instance.getData(PreferencesKeys.basket);
    basketList.forEach((element) {
      SpecifiedMeal meal = SpecifiedMeal.fromJson(jsonDecode(element));
      addBasket(meal);
    });
  }

  List<SpecifiedMeal> _basketItems = [];
  List<SpecifiedMeal> get getBasketItems => _basketItems;
  bool isInBasket(String value) => _basketItems
      .where((SpecifiedMeal meal) => meal.idMeal == value)
      .isNotEmpty;

  addBasketToggle(SpecifiedMeal value) async {
    List<String> specifiedJsonList = [];
    if (isInBasket(value.idMeal)) {
      removeFromBasket(value);
      _basketItems.forEach((element) {
        specifiedJsonList.add(jsonEncode(element));
      });
      await LocalStorageManager.instance
          .insertData(PreferencesKeys.basket, specifiedJsonList);
    } else {
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
}
