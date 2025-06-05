import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFF2F4F8),
    primaryColor: const Color(0xFF3879E9),
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF3879E9),
      onPrimary: Colors.white,
      surface: Colors.white,
      onSurface: Colors.black,
      outline: Colors.grey,
    ),
    useMaterial3: true,
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF3879E9),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF3879E9),
      onPrimary: Colors.white,
      surface: Color(0xFF1E1E1E),
      onSurface: Colors.white,
      outline: Colors.grey,
    ),
    useMaterial3: true,
  );
}
