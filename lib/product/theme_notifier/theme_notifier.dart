import 'package:flutter/material.dart';
import 'package:meal_recipe_flutter/core/constants/app_constants.dart';
import 'package:meal_recipe_flutter/core/theme/app_theme.dart';
import 'package:meal_recipe_flutter/service/shared_preferences.dart';

class ThemeNotifier extends ChangeNotifier {

  late bool isLightTheme = SharedPrefs.instance.prefs.getBool(AppConstants.themeSP) ?? true;

  void changeTheme() {
    SharedPrefs.instance.prefs.setBool(AppConstants.themeSP, !isLightTheme);
    notifyListeners();
    isLightTheme = !isLightTheme;
  }

  ThemeData get currentTheme => !isLightTheme ? AppTheme.lightTheme : AppTheme.darkTheme;
}