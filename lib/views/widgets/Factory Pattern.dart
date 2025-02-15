import 'package:flutter/material.dart';
import 'package:tourist_app/views/widgets/language_switcher.dart';
import 'package:tourist_app/views/widgets/theme_switcher.dart';

class WidgetFactory {
  static Widget createWidget(String type) {
    switch (type) {
      case 'language':
        return const LanguageSwitcher();
      case 'theme':
        return const ThemeSwitcher();
      default:
        throw Exception("Unknown widget type");
    }
  }
}
