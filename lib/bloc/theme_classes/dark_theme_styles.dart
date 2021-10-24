import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(brightness: isDarkTheme ? Brightness.dark : Brightness.light, primaryColor: Colors.teal, primarySwatch: Colors.teal);
  }
}
