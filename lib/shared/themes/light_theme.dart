import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.black,
        secondary: const Color(0xFF5E5F62),
        primary: Colors.black,
        primaryContainer: Colors.black12,
        shadow: const Color.fromRGBO(0, 0, 0, 0.05999999865889549),
        surface: const Color(0xFFD9D9D9)
    ),
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: ThemeData().textTheme.titleSmall?.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w400
      ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)
      ),
    ),
    scaffoldBackgroundColor: Colors.white
);