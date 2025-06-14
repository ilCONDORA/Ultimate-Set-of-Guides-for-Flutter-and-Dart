import 'package:flutter/material.dart';

class MyOwnAppTheme {
  /// base theme
  static ThemeData _baseTheme() => ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        visualDensity: VisualDensity.compact,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          titleTextStyle: TextStyle(fontSize: 30),
          scrolledUnderElevation: 0,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 20),
          bodyMedium: TextStyle(fontSize: 20),
          bodySmall: TextStyle(fontSize: 18),
        ),
      );

  /// Light theme
  static ThemeData get lightTheme => _baseTheme().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade300,
        appBarTheme: _baseTheme().appBarTheme.copyWith(
              titleTextStyle: _baseTheme().appBarTheme.titleTextStyle?.copyWith(
                    color: Colors.black,
                  ),
            ),
      );

  /// Dark theme
  static ThemeData get darkTheme => _baseTheme().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade900,
        appBarTheme: _baseTheme().appBarTheme.copyWith(
              titleTextStyle: _baseTheme().appBarTheme.titleTextStyle?.copyWith(
                    color: Colors.white,
                  ),
            ),
      );
}
