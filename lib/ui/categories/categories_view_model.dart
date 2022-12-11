import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery_test/api/concrete/meal_service_imp.dart';
import 'package:food_delivery_test/di/locator.dart';
import 'package:food_delivery_test/models/categories_model.dart';
import 'package:food_delivery_test/route/route.gr.dart';
import 'package:food_delivery_test/ui/master/master_view_model.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class CategoriesViewModel extends BaseViewModel {
  BuildContext viewModelContext;
  CategoriesViewModel(BuildContext context) {
    viewModelContext = context;
  }
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
      categoryResponse = await FoodDeliveryAppService.instance.getCategories();
      notifyListeners();
    } catch (e) {
      rethrow;
    }
    return categoryResponse;
  }

  setSelectedCategoryName(String categoryName) {
    Provider.of<MasterViewModel>(viewModelContext, listen: false)
        .setSelectedCategoryName = categoryName;
    AutoRouter.of(viewModelContext)
        .navigate(CategoriesRouter(children: [MealsRoute()]));
  }
}
