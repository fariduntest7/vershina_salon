import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get darkTheme {
    final base = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF0B0B0D),
      cardColor: const Color(0xFF19191F),
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFFD6B56D),
        secondary: Color(0xFFB99650),
        surface: Color(0xFF121216),
        error: Color(0xFFE05B61),
        tertiary: Color(0xFF39B980),
      ),
      fontFamily: 'Inter',
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF121216),
        foregroundColor: Color(0xFFF5F2EC),
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: Color(0xFF121216),
        indicatorColor: Color(0xFFD6B56D),
        labelTextStyle: WidgetStatePropertyAll(
          TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      cardTheme: CardTheme(
        color: const Color(0xFF19191F),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xFFD6B56D),
        foregroundColor: Color(0xFF121216),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF19191F),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFF303037)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFF303037)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFFD6B56D)),
        ),
      ),
    );

    return base.copyWith(
      textTheme: base.textTheme.apply(
        bodyColor: const Color(0xFFF5F2EC),
        displayColor: const Color(0xFFF5F2EC),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFD6B56D),
          foregroundColor: const Color(0xFF121216),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: const Color(0xFFD6B56D),
        ),
      ),
    );
  }

  static ThemeData get lightTheme => darkTheme;
}
