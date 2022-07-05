import 'package:flutter/foundation.dart';
import 'package:meal_recipe_flutter/model/category/category_model.dart';
import 'package:meal_recipe_flutter/model/area/area_model.dart';
import 'package:meal_recipe_flutter/model/ingredient/ingredient_model.dart';
import 'package:meal_recipe_flutter/service/meal_service.dart';

class ModelProvider extends ChangeNotifier {
  final IMealService mealService;
  List<Categories> resourcesCategory = [];
  List<Meals> resourcesArea = [];
  List<MealsI> resourcesIngredient = [];
  bool isLoading = false;

  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  ModelProvider(this.mealService, int model) {
    // 0 => all
    // 1 => categories
    // 2 => areas
    // 3 => ingredients
    // 4 => recipes
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
      // case 4:
      //   _fetchRecipes();
      //   break;
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
}

