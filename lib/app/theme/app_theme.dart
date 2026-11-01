import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get darkTheme {
    final base = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF0B0B0D),
      canvasColor: const Color(0xFF0B0B0D),
      cardColor: const Color(0xFF19191F),
      dividerColor: const Color(0xFF2A2A31),
      hintColor: const Color(0xFF9D9AA1),
      fontFamily: 'Inter',
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFFD6B56D),
        primaryContainer: Color(0xFFB99650),
        secondary: Color(0xFFB99650),
        secondaryContainer: Color(0xFF8F7138),
        surface: Color(0xFF121216),
        surfaceContainerHighest: Color(0xFF1E1E25),
        onSurface: Color(0xFFF5F2EC),
        onPrimary: Color(0xFF121216),
        error: Color(0xFFE05B61),
        tertiary: Color(0xFF39B980),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF121216),
        foregroundColor: Color(0xFFF5F2EC),
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: const Color(0xFF121216),
        surfaceTintColor: Colors.transparent,
        indicatorColor: const Color(0xFFD6B56D),
        labelTextStyle: WidgetStateProperty.all(
          const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.1,
          ),
        ),
        iconTheme: WidgetStateProperty.all(
          const IconThemeData(color: Color(0xFFF5F2EC)),
        ),
      ),
      cardTheme: CardTheme(
        color: const Color(0xFF19191F),
        elevation: 0,
        shadowColor: Colors.transparent,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: const BorderSide(color: Color(0xFF2A2A31)),
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xFFD6B56D),
        foregroundColor: Color(0xFF121216),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF19191F),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFFE05B61)),
        ),
      ),
      listTileTheme: const ListTileThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(14)),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: const Color(0xFF19191F),
        selectedColor: const Color(0xFFD6B56D),
        secondarySelectedColor: const Color(0xFFD6B56D),
        labelStyle: const TextStyle(
          color: Color(0xFFF5F2EC),
          fontWeight: FontWeight.w600,
        ),
        side: const BorderSide(color: Color(0xFF303037)),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(999),
        ),
      ),
      dialogTheme: DialogTheme(
        backgroundColor: const Color(0xFF19191F),
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: Color(0xFF2A2A31)),
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Color(0xFF121216),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: Color(0xFF2A2A31),
        thickness: 1,
        space: 1,
      ),
    );

    return base.copyWith(
      textTheme: base.textTheme.apply(
        bodyColor: const Color(0xFFF5F2EC),
        displayColor: const Color(0xFFF5F2EC),
      ),
      primaryTextTheme: base.primaryTextTheme.apply(
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
          textStyle: const TextStyle(
            fontWeight: FontWeight.w700,
            letterSpacing: 0.2,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: const Color(0xFFD6B56D),
          textStyle: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: const Color(0xFFF5F2EC),
          side: const BorderSide(color: Color(0xFF2A2A31)),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }

  static ThemeData get lightTheme => darkTheme;
}
