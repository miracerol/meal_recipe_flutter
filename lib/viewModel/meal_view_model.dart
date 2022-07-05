

import 'dart:core';

import 'package:meal_recipe_flutter/product/loadingWidget.dart';
import 'package:meal_recipe_flutter/service/meal_service.dart';
import 'package:meal_recipe_flutter/service/network_manager.dart';
import 'package:meal_recipe_flutter/view/home/home_view.dart';
import '../model/category/category_model.dart';

abstract class ReqresViewModel extends LoadingStatefull<HomeView> {
  late final IMealService mealService;

  List<Categories> resources = [];
  @override
  void initState() {
    super.initState();
    mealService = MealService(ProjectNetworkManager.instance.service);
    _fetch();
  }

  Future<void> _fetch() async {
    changeLoading();
    resources = (await mealService.fetchCategories())?.categories ?? [];
    changeLoading();
  }
}