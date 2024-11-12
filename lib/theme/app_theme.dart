import 'package:flutter/material.dart';

class LightTheme {
  static ThemeData lightThemeData = ThemeData(
    useMaterial3: false,
    appBarTheme: const AppBarTheme(
      elevation: 1,
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: const Color.fromARGB(255, 174, 133, 255),
      secondary: const Color.fromARGB(255, 215, 183, 255),
    ),
    textTheme: ThemeData.light().textTheme.copyWith(
          bodyMedium: const TextStyle(
            color: Colors.black,
          ),
          titleLarge: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: const TextStyle(
            color: Colors.black,
          ),
          titleSmall: const TextStyle(
            color: Colors.black,
          ),
        ),
  );
}

class DarkTheme {
  static ThemeData darkThemeData = ThemeData(
    useMaterial3: false,
    appBarTheme: const AppBarTheme(
      elevation: 1,
    ),
    colorScheme: ColorScheme.fromSwatch(
      brightness: Brightness.dark,
    ).copyWith(
      primary: const Color.fromARGB(255, 105, 105, 105),
      secondary: const Color.fromARGB(255, 117, 117, 117),
    ),
    textTheme: ThemeData.dark().textTheme.copyWith(
          bodyMedium: const TextStyle(
            color: Colors.white,
          ),
          titleLarge: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: const TextStyle(
            color: Colors.white,
          ),
          titleSmall: const TextStyle(
            color: Colors.white,
          ),
        ),
  );
}
