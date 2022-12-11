import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:provider/provider.dart';
import '../../api/concrete/meal_service_imp.dart';
import '../../models/meals_model.dart';
import '../../route/route.gr.dart';
import '../master/master_view_model.dart';
import 'package:provider/provider.dart';

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
          viewModelContext.read<MasterViewModel>().selectedCategoryName);
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
