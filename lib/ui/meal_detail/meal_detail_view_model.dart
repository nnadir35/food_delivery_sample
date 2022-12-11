import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_delivery_test/models/meal_detail_model.dart';
import 'package:food_delivery_test/ui/meals/meals_view_model.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import '../../api/concrete/meal_service_imp.dart';
import '../master/master_view_model.dart';

class MealDetailViewModel extends BaseViewModel {
  SpecifiedMeal specifiedmealsResponse;
  BuildContext viewModelContext;

  MealDetailViewModel(BuildContext context) {
    viewModelContext = context;
  }

  Future<void> init() async {
    setBusy(true);
    if (specifiedmealsResponse == null) {
      await getSpecifiedMeals();
    }
    notifyListeners();
    setBusy(false);
  }

  Future<MealWithDetail> getSpecifiedMeals() async {
    var response;
    try {
      response = await FoodDeliveryAppService.instance
          .getSpecifiedMealWithDetail(
              viewModelContext.read<MasterViewModel>().selectedMealName);
      specifiedmealsResponse = response.meals.first;
      notifyListeners();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
    return response;
  }
}
