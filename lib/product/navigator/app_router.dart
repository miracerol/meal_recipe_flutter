
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:meal_recipe_flutter/view/meal_detail/meal_detail_view.dart';
import 'package:meal_recipe_flutter/view/meal_list/meal_list_view.dart';

import '../../view/home/home_view.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: HomeView,
      path: 'home',
      initial: true,
    ),
    AutoRoute(page: MealListView, path: 'filter/:type/:query'),
    AutoRoute(page: DetailView, path: 'detail/:id'),
  ],
)

// extend the generated private router
class AppRouter extends _$AppRouter {
}

