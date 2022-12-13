import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import '../../api/concrete/meal_service_imp.dart';
import '../../api/viewmodel/base_categories_view_model.dart';
import '../../models/meals_model.dart';
import '../../route/route.gr.dart';
import '../master/master_view_model.dart';

class MealsViewModel extends BaseViewModel {
  Meals mealsResponse;
  BuildContext viewModelContext;
  MealsViewModel(BuildContext context) {
    viewModelContext = context;
  }
  Future<void> init() async {
    setBusy(true);
    if (mealsResponse == null) {
      await getMeals();
    }
    notifyListeners();
    setBusy(false);
  }

  Future<Meals> getMeals() async {
    try {
      mealsResponse = await FoodDeliveryAppService.instance.getMealsByCategory(
          viewModelContext
              .read<BaseCategoriesViewModel>()
              .selectedCategoryName);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
    return mealsResponse;
  }

  setSelectedMealName(String mealName) {
    Provider.of<MasterViewModel>(viewModelContext, listen: false)
        .setSelectedMealName = mealName;

    AutoRouter.of(viewModelContext)
        .navigate(CategoriesRouter(children: [MealDetailRoute()]));
  }
}
