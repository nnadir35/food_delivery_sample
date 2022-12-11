import 'dart:developer';

import 'package:food_delivery_test/api/abstract/meal_service.dart';
import 'package:food_delivery_test/constants/api_constants.dart';
import 'package:food_delivery_test/models/categories_model.dart';

import '../../manager/network_manager.dart';

class MealService extends IMealService {
  static final MealService _instance = MealService._init();
  static MealService get instance => _instance;
  MealService._init();

  final _apiNetwork = ApiNetworkManager.instance.dio;

  @override
  Future<Categories> getCategories() async {
    try {
      var response = await _apiNetwork.get(ApiConstants.categories);
      log(response.statusMessage);
      if (response.statusCode == 200) {
        return Categories.fromJson(response.data);
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}
