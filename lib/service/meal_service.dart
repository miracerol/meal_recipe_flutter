import 'dart:io';

import 'package:dio/dio.dart';
import 'package:meal_recipe_flutter/core/constants/api_constants.dart';
import 'package:meal_recipe_flutter/model/category/category_model.dart';
import 'package:meal_recipe_flutter/view/home/home_view.dart';
import '../model/area/area_model.dart';
import '../model/ingredient/ingredient_model.dart';
import '../model/searchItem/search_item_model.dart';
import '../model/meal/meal_model.dart';

abstract class IMealService {
  IMealService(this.dio);

  final Dio dio;

  Future<Category?> fetchCategories();

  Future<Area?> fetchAreas();

  Future<Ingredient?> fetchIngredients();

  Future<SearchItem?> fetchSearchItems(String type, String name);

  Future<Meal?> fetchMeal(String id);
}

class MealService extends IMealService {
  MealService(Dio dio) : super(dio);

  @override
  Future<Category?> fetchCategories() async {
    final response = await dio.get(ApiConstants.apiCategories);
    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is Map<String, dynamic>) {
        return Category.fromJson(jsonBody);
      }
    }
    return null;
  }

  @override
  Future<Area?> fetchAreas() async {
    final response = await dio.get(ApiConstants.apiAreas);
    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is Map<String, dynamic>) {
        return Area.fromJson(jsonBody);
      }
    }
    return null;
  }

  @override
  Future<Ingredient?> fetchIngredients() async {
    final response = await dio.get(ApiConstants.apiIngredients);
    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is Map<String, dynamic>) {
        return Ingredient.fromJson(jsonBody);
      }
    }
    return null;
  }

  @override
  Future<SearchItem?> fetchSearchItems(String type, String name) async {
    final endpoint = type != LetterType.typeS.value
        ? '${ApiConstants.apiFilter}$type=$name'
        : '${ApiConstants.apiSearch}$name';

    final response = await dio.get(endpoint);

    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is Map<String, dynamic>) {
        return SearchItem.fromJson(jsonBody);
      }
    }
    return null;
  }

  @override
  Future<Meal?> fetchMeal(String id) async {
    final response = await dio.get('${ApiConstants.apiMeal}$id');
    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is Map<String, dynamic>) {
        return Meal.fromJson(jsonBody);
      }
    }
    return null;
  }
}
