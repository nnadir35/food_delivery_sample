import 'package:dio/dio.dart';

import '../constants/api_constants.dart';

class ApiNetworkManager {
  static ApiNetworkManager _instance;

  ApiNetworkManager._() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
    );
    dio = Dio(baseOptions);
  }

  static ApiNetworkManager get instance => _instance ??= ApiNetworkManager._();

  Dio dio;
}
