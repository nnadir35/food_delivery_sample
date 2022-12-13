import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import '../../api/concrete/meal_service_imp.dart';
import '../../api/viewmodel/base_categories_view_model.dart';
import '../../models/categories_model.dart';
import '../../route/route.gr.dart';
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
    Provider.of<BaseCategoriesViewModel>(viewModelContext, listen: false)
        .setSelectedCategoryName = categoryName;
    AutoRouter.of(viewModelContext)
        .navigate(CategoriesRouter(children: [MealsRoute()]));
  }
}
