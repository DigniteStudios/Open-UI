import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.dark(
      primary: const Color(0xFF5E4DB2),
      secondary: Colors.white,
      inversePrimary: const Color(0xFFDFD8FD),
      // secondary: const Color(0xFF5E5F62),
      // primary: Colors.black,
      // primaryContainer: Colors.black12,
      shadow: Colors.black26,
      surface: const Color(0xFF5E4DB2).withOpacity(.3)
    // onPrimary: Colors.white,
  ),
  textTheme: ThemeData().textTheme.apply(
    bodyColor: Colors.white,
    displayColor: Colors.white,
  ),
  useMaterial3: true,
  scaffoldBackgroundColor: const Color(0xFF2B273F),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF2B273F),
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: ThemeData().textTheme.titleSmall?.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.white
    ),
    border: OutlineInputBorder(
        borderSide: const BorderSide(
            color: Colors.white
        ),
        borderRadius: BorderRadius.circular(10)
    ),
  ),
);