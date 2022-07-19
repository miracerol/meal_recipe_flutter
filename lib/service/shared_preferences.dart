
import 'package:meal_recipe_flutter/core/constants/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs{
  static final instance = SharedPrefs._init();
  
  static late final SharedPreferences _prefs;

  SharedPreferences get prefs => _prefs;

  SharedPrefs._init()  {
    SharedPreferences.getInstance().then((value){
      _prefs = value;
    });
  }



  static Future<bool> setBool(String key, bool value) async {
    final preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(key, value);
  }
  static Future<bool?> getBool(String key) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getBool(key);
  }


  static Future<bool> setString(String key, String value) async {
    return _prefs.setString(key, value);
  }
  static Future<String?> getString(String key) async {
    return _prefs.getString(key);
  }
  static Future<bool> setInt(String key, int value) async {
    return _prefs.setInt(key, value);
  }
  static Future<int?> getInt(String key) async {
    return _prefs.getInt(key);
  }
  static Future<bool> setDouble(String key, double value) async {
    return _prefs.setDouble(key, value);
  }
  static Future<double?> getDouble(String key) async {
    return _prefs.getDouble(key);
  }


}