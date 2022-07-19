import 'package:flutter/material.dart';
import 'package:meal_recipe_flutter/core/constants/app_constants.dart';
import 'package:meal_recipe_flutter/core/theme/app_theme.dart';
import 'package:meal_recipe_flutter/product/theme_notifier/theme_notifier.dart';
import 'package:meal_recipe_flutter/service/shared_preferences.dart';
import 'package:meal_recipe_flutter/product/navigator/app_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _appRouter = AppRouter();

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeNotifier>.value(

        builder: (context, child) {
          final instance = SharedPrefs.instance;
          return MaterialApp.router(
            title: AppConstants.appName,
            debugShowCheckedModeBanner: false,
            // theme: AppTheme.lightTheme,
            theme: context.watch<ThemeNotifier>().currentTheme,
            routeInformationParser: _appRouter.defaultRouteParser(),
            routerDelegate: _appRouter.delegate(),
          );
        },
        value: ThemeNotifier());
  }
}
