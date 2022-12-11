import '../../models/categories_model.dart';

abstract class IMealService {
  Future<Categories> getCategories();
}
