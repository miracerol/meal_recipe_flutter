import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData.light().copyWith(

      colorScheme: const ColorScheme.light(
        primary: Colors.black,
        secondary: Colors.white,
        error: Color(0xffec1d25),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xffef0086),
      ),
      textTheme: ThemeData.light().textTheme.copyWith(
        labelLarge: const TextStyle(
            fontFamily: 'OpenSans',fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
        labelMedium: const TextStyle(
            fontFamily: 'OpenSans',fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        labelSmall: const TextStyle(
            fontFamily: 'OpenSans',fontSize: 13, fontWeight: FontWeight.normal, color: Colors.black),
      ));
  static ThemeData get darkTheme => ThemeData.dark().copyWith(
      colorScheme: const ColorScheme.light(
        primary: Colors.white,
        secondary: Colors.black,
        error: Color(0xffef0086),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
      ),
      textTheme: ThemeData.dark().textTheme.copyWith(
        labelLarge: const TextStyle(
            fontFamily: 'OpenSans',fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        labelMedium: const TextStyle(
            fontFamily: 'OpenSans',fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        labelSmall: const TextStyle(
            fontFamily: 'OpenSans',fontSize: 13, fontWeight: FontWeight.normal, color: Colors.white),
      ));
}
