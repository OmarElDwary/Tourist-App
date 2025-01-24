import 'package:flutter/material.dart';

class MyTheme {
  static Color goldColor = Color(0xffD4AF37);
  static Color nileBlue = Color(0xff1A5276);
  static Color sandColor = Color(0xffD2B48C);
  static Color papyrusColor = Color(0xffF0E68C);
  static Color darkBrown = Color(0xff654321);
  static Color whiteColor = Color(0xffffffff);

  static ThemeData createTheme({
    required Brightness brightness,
    required Color primaryColor,
    required Color scaffoldBackgroundColor,
    required Color selectedItemColor,
    required Color unselectedItemColor,
    required Color iconColor,
  }) {
    return ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: iconColor),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: selectedItemColor,
        unselectedItemColor: unselectedItemColor,
      ),
      brightness: brightness,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.brown,
        brightness: brightness,
      ),
      useMaterial3: true,
      inputDecorationTheme: const InputDecorationTheme(
        errorStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
      fontFamily: 'Lora',
    );
  }

  static ThemeData get lightTheme => createTheme(
        brightness: Brightness.light,
        primaryColor: darkBrown,
        scaffoldBackgroundColor: sandColor,
        selectedItemColor: goldColor,
        unselectedItemColor: darkBrown,
        iconColor: darkBrown,
      );

  static ThemeData get darkTheme => createTheme(
        brightness: Brightness.dark,
        primaryColor: nileBlue,
        scaffoldBackgroundColor: darkBrown,
        selectedItemColor: goldColor,
        unselectedItemColor: papyrusColor,
        iconColor: goldColor,
      );
}
