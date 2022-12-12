import 'dart:convert';
import 'dart:developer';

import 'package:food_delivery_test/enum/preference_keys.dart';
import 'package:food_delivery_test/manager/locale_storage_manager.dart';
import 'package:food_delivery_test/models/meal_detail_model.dart';
import 'package:stacked/stacked.dart';

import '../../models/meals_model.dart';

class MasterViewModel extends BaseViewModel {
  Future<void> init() async {
    LocalStorageManager.instance.initSharedPref();
    var favoritesList =
        await LocalStorageManager.instance.getData(PreferencesKeys.favorites);
    favoritesList.forEach((element) {
      SpecifiedMeal meal = SpecifiedMeal.fromJson(jsonDecode(element));
      addFavoritesMealListID(meal.idMeal);
      addFavoritesMealList(meal);
    });
  }

  String _selectedCategoryName = "";
  get selectedCategoryName => _selectedCategoryName;
  set setSelectedCategoryName(String s) {
    _selectedCategoryName = s;
    notifyListeners();
  }

  String _selectedMealName = "";
  get selectedMealName => _selectedMealName;
  set setSelectedMealName(String s) {
    _selectedMealName = s;
    notifyListeners();
  }

  List<String> _favoritedMealsIDs = [];
  List<SpecifiedMeal> _favoritedMeals = [];
  List<String> get getFavoritedMealIDs => _favoritedMealsIDs;
  List<SpecifiedMeal> get getFavoritedMeals => _favoritedMeals;

  Future<void> favoritedmealsToggle(SpecifiedMeal value) async {
    List<String> specifiedJsonList = [];
    if (_favoritedMealsIDs.contains(value.idMeal)) {
      _favoritedMealsIDs.remove(value.idMeal);
      _favoritedMeals.remove(value);
      _favoritedMeals.forEach((element) {
        specifiedJsonList.add(jsonEncode(element));
      });
      await LocalStorageManager.instance
          .insertData(PreferencesKeys.favorites, specifiedJsonList);
    } else {
      addFavoritesMealListID(value.idMeal);
      addFavoritesMealList(value);
      _favoritedMeals.forEach((element) {
        specifiedJsonList.add(jsonEncode(element));
      });
      await LocalStorageManager.instance
          .insertData(PreferencesKeys.favorites, specifiedJsonList);
    }
    notifyListeners();
  }

  addFavoritesMealList(SpecifiedMeal value) => _favoritedMeals.add(value);
  addFavoritesMealListID(String value) => _favoritedMealsIDs.add(value);

  bool isFavorited(String value) => getFavoritedMealIDs.contains(value);
}
