import 'package:flutter/material.dart';
import 'package:spotify_clone/core/configs/theme/app_colors.dart';
class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Satoshi',
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textOnPrimary,
        textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    ),
    textTheme: TextTheme(
      displaySmall: TextStyle(
        fontSize: 25.0,
        fontWeight: FontWeight.bold,
        color: Color(0xffDADADA),
      ),
      bodyMedium: TextStyle(
        color: Color(0xffDADADA),
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        fontSize: 17.0,
        color: Color(0xff797979),
        fontWeight: FontWeight.w400,
      ),
    ),
    
  );
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Satoshi',
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    ),
    
  );
}
