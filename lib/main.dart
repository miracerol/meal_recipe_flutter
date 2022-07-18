import 'package:flutter/material.dart';
import 'package:meal_recipe_flutter/core/constants/app_constants.dart';
import 'package:meal_recipe_flutter/core/theme/app_theme.dart';
import 'package:meal_recipe_flutter/product/loadingWidget.dart';
import 'package:meal_recipe_flutter/product/navigator/app_router.dart';
import 'package:meal_recipe_flutter/view/home/home_view.dart';
import 'package:meal_recipe_flutter/view/meal_detail/meal_detail_view.dart';
import 'package:meal_recipe_flutter/view/meal_list/meal_list_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _appRouter = AppRouter();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp.router(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(),
    );

    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   debugShowCheckedModeBanner: false,
    //   theme: AppTheme.lightTheme,
    //   home: const MealListView(type: "c", query: "Seafood"),
    // );
  }
}
