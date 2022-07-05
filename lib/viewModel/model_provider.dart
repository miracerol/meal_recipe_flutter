import 'package:flutter/foundation.dart';
import 'package:meal_recipe_flutter/model/category/category_model.dart';
import 'package:meal_recipe_flutter/model/area/area_model.dart';
import 'package:meal_recipe_flutter/model/ingredient/ingredient_model.dart';
import 'package:meal_recipe_flutter/model/searchItem/search_item_model.dart';
import 'package:meal_recipe_flutter/service/meal_service.dart';

import '../model/meal/meal_model.dart';

class ModelProvider extends ChangeNotifier {
  final IMealService mealService;
  List<Categories> resourcesCategory = [];
  List<MealsA> resourcesArea = [];
  List<MealsI> resourcesIngredient = [];
  List<ItemS> resourcesSearchItem = [];
  List<Meals> resourcesMeal = [];
  bool isLoading = false;

  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  ModelProvider(this.mealService, int model, [String type = "", String name =""]) {
    // 0 => all
    // 1 => categories
    // 2 => areas
    // 3 => ingredients
    // 4 => searchItem
    // 5 => meal
    switch (model) {
      case 0:
        _fetchAll();
        break;
      case 1:
        _fetchCategories();
        break;
      case 2:
        _fetchAreas();
        break;
      case 3:
        _fetchIngredients();
        break;
      case 4:
        _fetchSearchItems(type, name);
        break;
      case 5:
        _fetchMeals(type);
        break;
    }
  }

  Future<void> _fetchCategories() async {
    _changeLoading();
    resourcesCategory = (await mealService.fetchCategories())?.categories ?? [];
    _changeLoading();
  }

  Future<void> _fetchAreas() async {
    _changeLoading();
    resourcesArea = (await mealService.fetchAreas())?.meals ?? [];
    _changeLoading();
  }

  Future<void> _fetchIngredients() async {
    _changeLoading();
    resourcesIngredient = (await mealService.fetchIngredients())?.meals ?? [];
    _changeLoading();
  }

  Future<void> _fetchAll() async {
    _changeLoading();
    _fetchCategories();
    _fetchAreas();
    _fetchIngredients();

    _changeLoading();
  }

  Future<void> _fetchSearchItems(String type, String name) async {
    _changeLoading();
    resourcesSearchItem = (await mealService.fetchSearchItems(type,name))?.meals ?? [];
    _changeLoading();
  }

  Future<void> _fetchMeals(String type) async {
    _changeLoading();
    resourcesMeal = (await mealService.fetchMeal(type))?.meals ?? [];
    _changeLoading();
  }
}

