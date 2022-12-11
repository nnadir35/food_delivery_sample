import 'package:food_delivery_test/models/meal_detail_model.dart';

import '../../models/categories_model.dart';
import '../../models/meals_model.dart';

abstract class IFoodDeliveryAppService {
  Future<Categories> getCategories();
  Future<Meals> getMealsByCategory(String queryParameter);
  Future<MealWithDetail> getSpecifiedMealWithDetail(String queryParameter);
}
