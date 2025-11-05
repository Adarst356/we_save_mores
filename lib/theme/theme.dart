import 'package:flutter/material.dart';
import 'app_colors.dart';

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  primaryColor: appColors.primaryColor,
  scaffoldBackgroundColor: appColors.backgroundLight,

  ///Color scheme
  colorScheme: ColorScheme.light(
    primary: appColors.primaryColor,
    secondary: appColors.primaryLight,
    background: appColors.backgroundLight,
    surface: Colors.white,
    onPrimary: appColors.textLight,
    onSurface: appColors.textDark,
  ),

  /// AppBar
  appBarTheme: AppBarTheme(
    backgroundColor: appColors.backgroundLight,
    elevation: 2,
    titleTextStyle: TextStyle(
      color: appColors.textDark,
      fontSize: 22,
      fontWeight: FontWeight.w500,
    ),
    iconTheme: IconThemeData(color: appColors.textDark),
  ),

  /// Elevated Button
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: appColors.primaryColor,
      foregroundColor: appColors.textLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),

  /// Text theme
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: appColors.textDark),
    bodyMedium: TextStyle(color: appColors.textDark),
    bodySmall: TextStyle(color: appColors.textDark),
    titleLarge: TextStyle(color: appColors.primaryColor, fontWeight: FontWeight.bold),
    titleMedium: TextStyle(color: appColors.textDark),
    labelLarge: TextStyle(color: appColors.primaryColor),
  ),
);


final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  primaryColor: appColors.primaryColor,
  scaffoldBackgroundColor: appColors.backgroundDark,

  colorScheme: ColorScheme.dark(
    primary: appColors.primaryColor,
    secondary: appColors.primaryLight,
    background: appColors.backgroundDark,
    surface: Colors.grey[850]!,
    onPrimary: appColors.textLight,
    onSurface: appColors.textLight,
  ),

  appBarTheme: AppBarTheme(
    backgroundColor: appColors.backgroundDark,
    elevation: 2,
    titleTextStyle: TextStyle(
      color: appColors.textLight,
      fontSize: 22,
      fontWeight: FontWeight.w500,
    ),
    iconTheme: IconThemeData(color: appColors.textLight),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: appColors.primaryColor,
      foregroundColor: appColors.textLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),

  textTheme: TextTheme(
    bodyLarge: TextStyle(color: appColors.textLight),
    bodyMedium: TextStyle(color: appColors.textLight),
    bodySmall: TextStyle(color: appColors.textLight),
    titleLarge: TextStyle(color: appColors.primaryColor, fontWeight: FontWeight.bold),
    titleMedium: TextStyle(color: appColors.textLight),
    labelLarge: TextStyle(color: appColors.primaryColor),
  ),
);
