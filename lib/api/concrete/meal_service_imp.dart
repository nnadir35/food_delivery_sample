import '../../constants/api_constants.dart';
import '../../manager/network_manager.dart';
import '../../models/categories_model.dart';
import '../../models/meal_detail_model.dart';
import '../../models/meals_model.dart';
import '../abstract/meal_service.dart';

class FoodDeliveryAppService extends IFoodDeliveryAppService {
  static final FoodDeliveryAppService _instance =
      FoodDeliveryAppService._init();
  static FoodDeliveryAppService get instance => _instance;
  FoodDeliveryAppService._init();

  final _apiNetwork = ApiNetworkManager.instance.dio;

  @override
  Future<Categories> getCategories() async {
    try {
      var response = await _apiNetwork.get(ApiConstants.categories);
      if (response.statusCode == 200) {
        return Categories.fromJson(response.data);
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  @override
  Future<Meals> getMealsByCategory(String queryParameter) async {
    try {
      var response = await _apiNetwork.get(ApiConstants.mealsByCategories,
          queryParameters: {"c": queryParameter});
      if (response.statusCode == 200) {
        return Meals.fromJson(response.data);
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  @override
  Future<MealWithDetail> getSpecifiedMealWithDetail(
      String queryParameter) async {
    try {
      var response = await _apiNetwork.get(ApiConstants.mealWithDetail,
          queryParameters: {"s": queryParameter});
      if (response.statusCode == 200) {
        return MealWithDetail.fromJson(response.data);
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}
