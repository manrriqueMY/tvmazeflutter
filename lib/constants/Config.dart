import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Config {
  //origin uri: https://api.tvmaze.com
  static String URLTVMAZE = "api.tvmaze.com";
  static Color COLORPRIMARY = Color.fromRGBO(60, 148, 139, 1);
  static Color COLORPRIMARYACCENT = Color.fromRGBO(172, 221, 212, 1);
  static Color COLORSECONDARY = Color.fromRGBO(60, 148, 139, 1);
  static MaterialColor THEME = MaterialColor(
    0XFF3C948B,
    <int, Color>{
      50: COLORPRIMARY,
      100: COLORPRIMARY,
      200: COLORPRIMARY,
      300: COLORPRIMARY,
      400: COLORPRIMARY,
      500: COLORPRIMARY,
      600: COLORPRIMARY,
      700: COLORPRIMARY,
      800: COLORPRIMARY,
      900: COLORPRIMARY,
    },
  );
}
