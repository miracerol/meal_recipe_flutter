import 'package:flutter/material.dart';
import 'package:meal_recipe_flutter/core/theme/app_theme.dart';
import 'package:meal_recipe_flutter/view/home/home_view.dart';
import 'package:meal_recipe_flutter/view/meal_detail/meal_detail_view.dart';
import 'package:meal_recipe_flutter/view/meal_list/meal_list_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const DetailView(),
    );
  }
}
