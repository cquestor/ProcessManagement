import 'package:flutter/material.dart';

class Themes {
  static const Color lightBlack = Color(0xff342e31);
  static const Color lightGrey = Color(0xffb4b5aa);
  static const Color darkBlack = Color(0xff313642);
  static const Color darkGrey = Color(0xff3e4553);
  static const Color white = Color(0xfff7fbff);
  static const Color blue = Color(0xff63b4ff);
  static const Color green = Color(0xffb1d199);
  static const Color red = Color(0xffff7562);
  static const Color yellow = Color(0xfff8aa4d);
  static const Color purple = Color(0xffaa9aff);

  static MaterialColor lightPrimary =
      MaterialColor(blue.value, const <int, Color>{
    50: blue,
    100: blue,
    200: blue,
    300: blue,
    400: blue,
    500: blue,
    600: blue,
    700: blue,
    800: blue,
    900: blue,
  });

  static final ThemeData light = ThemeData(
    primarySwatch: lightPrimary,
    backgroundColor: white,
  );

  static final ThemeData dark = ThemeData(
    primaryColor: lightPrimary,
    backgroundColor: darkBlack,
  );
}
