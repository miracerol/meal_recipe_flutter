



import 'dart:io';

import 'package:dio/dio.dart';
import 'package:meal_recipe_flutter/model/category/category_model.dart';

abstract class IMealService{
  IMealService(this.dio);
  final Dio dio;

  Future<List<Category>?> fetchCategories();
}

class MealService extends IMealService {
  MealService(Dio dio) : super(dio);
  @override
  Future<List<Category>?> fetchCategories() async {
    final response = await dio.get('/categories.php');
    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is List) {
        return jsonBody.map((json) => Category.fromJson(json)).toList();
      }
    }
    return null;
  }

}