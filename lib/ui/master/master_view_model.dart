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
    var basketList =
        await LocalStorageManager.instance.getData(PreferencesKeys.basket);
    favoritesList.forEach((element) {
      SpecifiedMeal meal = SpecifiedMeal.fromJson(jsonDecode(element));
      addFavoritesMealListID(meal.idMeal);
      addFavoritesMealList(meal);
    });
    basketList.forEach((element) {
      SpecifiedMeal meal = SpecifiedMeal.fromJson(jsonDecode(element));
      addBasketItemIDList(meal.idMeal);
      addBasket(meal);
    });
  }

  String _selectedCategoryName = "";
  get selectedCategoryName => _selectedCategoryName;
  set setSelectedCategoryName(String s) {
    _selectedCategoryName = s;
    notifyListeners();
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

  List<String> _favoritedMealsIDs = [];
  List<String> _basketItemIDs = [];
  List<String> get basketItemIDs => _basketItemIDs;
  List<String> get getFavoritedMealIDs => _favoritedMealsIDs;
  List<SpecifiedMeal> _favoritedMeals = [];
  List<SpecifiedMeal> get getFavoritedMeals => _favoritedMeals;
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

  Future<void> favoritedmealsToggle(SpecifiedMeal value) async {
    List<String> specifiedJsonList = [];
    if (_favoritedMealsIDs.contains(value.idMeal)) {
      _favoritedMealsIDs.remove(value.idMeal);
      removeFromFavoritedMealList(value);
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

  addFavoritesMealList(SpecifiedMeal value) => _favoritedMeals.add(value);
  addFavoritesMealListID(String value) => _favoritedMealsIDs.add(value);

  addBasket(SpecifiedMeal value) => _basketItems.add(value);
  addBasketItemIDList(String value) => _basketItemIDs.add(value);

  bool isFavorited(String value) => getFavoritedMealIDs.contains(value);
  bool isInBasket(String value) => basketItemIDs.contains(value);
}
