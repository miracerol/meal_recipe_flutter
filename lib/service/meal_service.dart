



import 'dart:io';

import 'package:dio/dio.dart';
import 'package:meal_recipe_flutter/model/category/category_model.dart';

abstract class IMealService{
  IMealService(this.dio);
  final Dio dio;

  Future<Category?> fetchCategories();
}

class MealService extends IMealService {
  MealService(Dio dio) : super(dio);
  @override
  Future<Category?> fetchCategories() async {
    final response = await dio.get('/categories.php');
    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is Map<String, dynamic>) {
        return Category.fromJson(jsonBody);
      }
    }
    return null;
  }

}