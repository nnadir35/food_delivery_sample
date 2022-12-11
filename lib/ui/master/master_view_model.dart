import 'package:food_delivery_test/models/meal_detail_model.dart';
import 'package:stacked/stacked.dart';

import '../../models/meals_model.dart';

class MasterViewModel extends BaseViewModel {
  Future<void> init() async {}

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
  List<String> get getFavoritedMeals => _favoritedMealsIDs;
  void favoritedmealsToggle(String value) {
    !_favoritedMealsIDs.contains(value)
        ? _favoritedMealsIDs.add(value)
        : _favoritedMealsIDs.remove(value);
    notifyListeners();
  }

  void removeFromFavoritedMeals(String value) {
    _favoritedMealsIDs.remove(value);
    notifyListeners();
  }

  bool isFavorited(String value) => getFavoritedMeals.contains(value);
}
