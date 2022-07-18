import 'package:dio/dio.dart';
import 'package:meal_recipe_flutter/core/constants/api_constants.dart';

class ProjectNetworkManager {
  ProjectNetworkManager._() {
    _dio = Dio(BaseOptions(baseUrl: ApiConstants.apiBaseUrl+ApiConstants.apiKey,));
  }
  late final Dio _dio;

  static ProjectNetworkManager instance = ProjectNetworkManager._();

  Dio get service => _dio;

  void addBaseHeaderToToken(String token) {
    _dio.options = _dio.options.copyWith(headers: {"Authorization": token});
  }
}

class DurationManager {
  DurationManager._();
  static DurationManager? _manager;

  static DurationManager get manager {
    if (_manager != null) return _manager!;
    _manager = DurationManager._();
    return _manager!;
  }
}