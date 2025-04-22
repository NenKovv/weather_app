import 'package:flutter/material.dart';
import 'colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.skyLight,
    primaryColor: AppColors.skyMedium,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.skyNight,
      foregroundColor: Colors.white,
      centerTitle: true,
      elevation: 2,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      prefixIconColor: AppColors.skyDeep,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      labelStyle: const TextStyle(color: Colors.black87),
      contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 14),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.skyMedium,
        foregroundColor: Colors.white,
        disabledBackgroundColor: Colors.blueGrey,
        padding: const EdgeInsets.symmetric(vertical: 16),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    cardColor: Colors.white,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(fontSize: 16, color: Colors.black87),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColors.skyMedium,
      secondary: AppColors.skySoft,
      error: Colors.redAccent,
    ),
  );
}
