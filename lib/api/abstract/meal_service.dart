import '../../models/categories_model.dart';
import '../../models/meals_model.dart';

abstract class IFoodDeliveryAppService {
  Future<Categories> getCategories();
  Future<Meals> getMealsByCategory(String queryParameter);
}
