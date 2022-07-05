



import 'dart:io';

import 'package:dio/dio.dart';
import 'package:meal_recipe_flutter/model/category/category_model.dart';

import '../model/area/area_model.dart';
import '../model/ingredient/ingredient_model.dart';
import '../model/searchItem/search_item_model.dart';

abstract class IMealService{
  IMealService(this.dio);
  final Dio dio;

  Future<Category?> fetchCategories();
  Future<Area?> fetchAreas();
  Future<Ingredient?> fetchIngredients();
  Future<SearchItem?> fetchSearchItems(String type, String name);
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

  @override
  Future<Area?> fetchAreas() async {
    final response = await dio.get('/list.php?a=list');
    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is Map<String, dynamic>) {
        return Area.fromJson(jsonBody);
      }
    }
    return null;
  }

  @override
  Future<Ingredient?> fetchIngredients() async{
    final response = await dio.get('/list.php?i=list');
    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is Map<String, dynamic>) {
        return Ingredient.fromJson(jsonBody);
      }
    }
    return null;
  }

  @override
  Future<SearchItem?> fetchSearchItems(String type, String name) async{
    final response = await dio.get('/filter.php?$type=$name');
    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is Map<String, dynamic>) {
        return SearchItem.fromJson(jsonBody);
      }
    }
    return null;
  }



}