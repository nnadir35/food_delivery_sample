import 'dart:convert';
import 'dart:developer';

import 'package:stacked/stacked.dart';

import '../../enum/preference_keys.dart';
import '../../manager/locale_storage_manager.dart';
import '../../models/meal_detail_model.dart';

class BaseCategoriesViewModel extends BaseViewModel {
  BaseCategoriesViewModel() {
    getPersistenceFavoritedItems();
  }

  getPersistenceFavoritedItems() async {
    LocalStorageManager.instance.initSharedPref();
    var favoritesList =
        await LocalStorageManager.instance.getData(PreferencesKeys.favorites);
    favoritesList.forEach((element) {
      SpecifiedMeal meal = SpecifiedMeal.fromJson(jsonDecode(element));
      addFavoritedMealList(meal);
    });
    notifyListeners();
  }

  String _selectedCategoryName = "";
  get selectedCategoryName => _selectedCategoryName;
  set setSelectedCategoryName(String s) {
    _selectedCategoryName = s;
    notifyListeners();
  }

  List<SpecifiedMeal> _favoritedMeals = [];
  List<SpecifiedMeal> get getFavoritedMeals => _favoritedMeals;
  addFavoritedMealList(SpecifiedMeal value) => _favoritedMeals.add(value);
  bool isFavorited(String value) =>
      _favoritedMeals.where((element) => element.idMeal == value).isNotEmpty;

  Future<void> favoritedmealsToggle(SpecifiedMeal value) async {
    List<String> specifiedJsonList = [];
    if (isFavorited(value.idMeal)) {
      removeFromFavoritedMealList(value);
      _favoritedMeals.forEach((element) {
        specifiedJsonList.add(jsonEncode(element));
      });
      await LocalStorageManager.instance
          .insertData(PreferencesKeys.favorites, specifiedJsonList);
    } else {
      addFavoritedMealList(value);
      _favoritedMeals.forEach((element) {
        specifiedJsonList.add(jsonEncode(element));
      });
      await LocalStorageManager.instance
          .insertData(PreferencesKeys.favorites, specifiedJsonList);
    }
    notifyListeners();
  }

  removeFromFavoritedMealList(SpecifiedMeal value) {
    SpecifiedMeal toBeDeleted;
    _favoritedMeals.forEach((item) {
      if (item.idMeal == value.idMeal) {
        toBeDeleted = item;
      }
    });
    _favoritedMeals.remove(toBeDeleted);
    notifyListeners();
  }
}
