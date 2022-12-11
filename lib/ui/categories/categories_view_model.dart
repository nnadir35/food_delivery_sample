import 'dart:developer';

import 'package:food_delivery_test/api/concrete/meal_service_imp.dart';
import 'package:food_delivery_test/models/categories_model.dart';
import 'package:stacked/stacked.dart';

class CategoriesViewModel extends BaseViewModel {
  Categories categoryResponse;
  Future<void> init() async {
    setBusy(true);
    if (categoryResponse == null) {
      await getCategories();
    }
    notifyListeners();
    setBusy(false);
  }

  Future<Categories> getCategories() async {
    try {
      categoryResponse = await MealService.instance.getCategories();
      notifyListeners();
    } catch (e) {
      rethrow;
    }
    return categoryResponse;
  }
}
