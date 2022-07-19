import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData.light().copyWith(
        colorScheme: const ColorScheme.light(
          primary: ColorPalette.mexicanPink,
          secondary: Colors.white,
          outline: Colors.grey,
          error: ColorPalette.pigmentRed,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: ColorPalette.mexicanPink,
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
              labelLarge: const TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              labelMedium: const TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              labelSmall: const TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              headlineSmall: const TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
            ),
      );

  static ThemeData get darkTheme => ThemeData.dark().copyWith(
        colorScheme: const ColorScheme.light(
          primary: ColorPalette.mexicanPink,
          secondary: ColorPalette.eerieBlack,
          outline: ColorPalette.davyGrey,
          error: ColorPalette.pigmentRed,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: ColorPalette.mexicanPink,
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        ),
        textTheme: ThemeData.dark().textTheme.copyWith(
              labelLarge: const TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              labelMedium: const TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              labelSmall: const TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              headlineSmall: const TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Colors.white),
            ),
      );
}

class ColorPalette {
  static const Color mexicanPink = Color(0xffef0086);
  static const Color eerieBlack = Color(0x381F1C1C);
  static const Color davyGrey = Color(0xff5e5e5e);
  static const Color pigmentRed = Color(0xffec1d25);
}
