import 'package:flutter/material.dart';

class AppColors {
  static const Color background = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFFDBDBDB);
  static const Color textPrimary = Color(0xFF000000);
  static const Color textSecondary = Color(0xFF8E8E8E);
}

class MyAppTheme {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: const ColorScheme.light(
      onPrimary: AppColors.textPrimary,
      secondary: AppColors.grey,
      onSecondary: AppColors.textSecondary,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.textPrimary),
      bodyMedium: TextStyle(color: AppColors.textPrimary),
    ),
    iconTheme: const IconThemeData(
      color: AppColors.textPrimary,
    ),
    appBarTheme: const AppBarTheme(
      color: AppColors.background,
      iconTheme: IconThemeData(color: AppColors.textPrimary),
      titleTextStyle: TextStyle(color: AppColors.textPrimary, fontSize: 20.0),
    ),
  );
}
