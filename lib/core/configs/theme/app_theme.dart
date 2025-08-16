import 'package:flutter/material.dart';
import 'package:spotify_clone/core/configs/theme/app_colors.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Satoshi',
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    // iconTheme: IconThemeData(color: AppColors.iconLight),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.light,
    ).copyWith(surface: AppColors.surfaceLight),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.iconLight),
      centerTitle: true,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textOnPrimary,
        textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
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
      headlineSmall: TextStyle(
        fontSize: 25.0,
        fontWeight: FontWeight.bold,
        color: AppColors.textLight.withValues(alpha: 0.78),
      ),
      bodyMedium: TextStyle(
        color: Color(0xff797979),
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
      ),
      bodySmall: TextStyle(
        fontSize: 12.0,
        color: AppColors.textLightSecondary,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: TextStyle(
        fontSize: 19.0,
        color: AppColors.textLightSecondary,
        fontWeight: FontWeight.bold,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.transparent,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        borderSide: BorderSide(
          color: AppColors.backgroundDark.withValues(alpha: 0.2),
          width: 1.0,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        borderSide: BorderSide(
          color: AppColors.backgroundDark.withValues(alpha: 0.4),
          width: 1.0,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        borderSide: BorderSide(
          color: const Color.fromARGB(255, 186, 51, 42).withValues(alpha: 0.8),
          width: 1.0,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        borderSide: BorderSide(
          color: const Color.fromARGB(255, 186, 51, 42).withValues(alpha: 0.8),
          width: 1.0,
        ),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 24.0),
      hintStyle: TextStyle(
        color: AppColors.textLightSecondary.withValues(alpha: 0.6),
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Satoshi',
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    iconTheme: IconThemeData(color: AppColors.iconDark, size: 24.0),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.dark,
    ).copyWith(surface: AppColors.surfaceDark),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.iconDark),
      centerTitle: true,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textOnPrimary,
        textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
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
      headlineSmall: TextStyle(
        fontSize: 25.0,
        fontWeight: FontWeight.bold,
        color: AppColors.textDarkSecondary,
      ),
      bodyMedium: TextStyle(
        color: Color(0xffA0A0A0),
        fontWeight: FontWeight.w500,
        fontSize: 17.0,
      ),
      bodySmall: TextStyle(
        fontSize: 12.0,
        color: AppColors.textDarkSecondary,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: TextStyle(
        fontSize: 19.0,
        color: AppColors.textDarkSecondary,
        fontWeight: FontWeight.bold,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.transparent,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        borderSide: BorderSide(
          color: AppColors.backgroundLight.withValues(alpha: 0.14),
          width: 1.0,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        borderSide: BorderSide(
          color: AppColors.backgroundLight.withValues(alpha: 0.30),
          width: 1.0,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        borderSide: BorderSide(
          color: const Color.fromARGB(255, 186, 51, 42).withValues(alpha: 0.8),
          width: 1.0,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        borderSide: BorderSide(
          color: const Color.fromARGB(255, 186, 51, 42).withValues(alpha: 0.8),
          width: 1.0,
        ),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
      hintStyle: TextStyle(
        color: Color(0xffA7A7A7).withValues(alpha: 0.6),
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
