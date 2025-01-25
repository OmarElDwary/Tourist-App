import 'package:flutter/material.dart';
import 'package:tourist_app/my_theme.dart';

abstract class ThemeState {
  final ThemeData themeData;

  const ThemeState(this.themeData);
}

class LightThemeState extends ThemeState {
  LightThemeState() : super(MyTheme.lightTheme);
}

class DarkThemeState extends ThemeState {
  DarkThemeState() : super(MyTheme.darkTheme);
}
