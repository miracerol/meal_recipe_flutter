import 'package:flutter/foundation.dart';
import 'package:meal_recipe_flutter/model/category/category_model.dart';
import 'package:meal_recipe_flutter/service/meal_service.dart';

class ModelProvider extends ChangeNotifier {
  final IMealService mealService;

  List<Categories> resources = [];
  bool isLoading = false;

  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  ModelProvider(this.mealService) {
    _fetch();
  }

  Future<void> _fetch() async {
    _changeLoading();
    resources = await fetchItems();
    _changeLoading();
  }

  Future<List<Categories>> fetchItems() async {
    return (await mealService.fetchCategories())?.categories ?? [];
  }

}