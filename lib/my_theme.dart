import 'package:flutter/material.dart';

class MyTheme {
  static Color lightBrown = Color(0xffD7B77A);
  static Color mediumBrown = Color(0xffC69C6D);
  static Color darkBrown = Color(0xff8B5A2B);
  static Color veryDarkBrown = Color(0xff5B3A29);
  static Color deepBrown = Color(0xff3C2A20);
  static Color beige = Color(0xffF5F5DC);
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
        primaryColor: mediumBrown,
        scaffoldBackgroundColor: beige,
        selectedItemColor: lightBrown,
        unselectedItemColor: darkBrown,
        iconColor: darkBrown,
      );

  static ThemeData get darkTheme => createTheme(
        brightness: Brightness.dark,
        primaryColor: deepBrown,
        scaffoldBackgroundColor: veryDarkBrown,
        selectedItemColor: lightBrown,
        unselectedItemColor: beige,
        iconColor: lightBrown,
      );
}