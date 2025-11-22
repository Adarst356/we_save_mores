import 'package:flutter/material.dart';
import 'app_colors.dart';

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  primaryColor: appColors.primaryColor,
  scaffoldBackgroundColor: appColors.backgroundLight,

  colorScheme: ColorScheme.light(
    primary: appColors.primaryColor,
    secondary: appColors.yellow,
    background: appColors.backgroundLight,
    surface: Colors.white,
    onPrimary: appColors.textLight,
    onSurface: appColors.textDark,
  ),


  /// ✅ AppBar
  appBarTheme: AppBarTheme(
    backgroundColor: appColors.primaryColor,
    elevation: 2,
    titleTextStyle: TextStyle(
      color: appColors.textDark,
      fontSize: 22,
      fontWeight: FontWeight.w500,
    ),
    iconTheme: IconThemeData(color: appColors.textDark),
  ),

  /// ✅ Bottom Navigation Theme
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: appColors.primaryColor,
    unselectedItemColor: appColors.textGrey,
    showUnselectedLabels: true,
    type: BottomNavigationBarType.fixed,
  ),

  // /// ✅ BottomAppBar Theme (for floating button)
  // bottomAppBarTheme: BottomAppBarTheme(
  //   color: Colors.white,
  //   elevation: 8,
  //   surfaceTintColor: Colors.white,
  //   shadowColor: Colors.black12,
  // ),

  /// ✅ Elevated Button
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: appColors.primaryColor,
      foregroundColor: appColors.textLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  ),

  /// ✅ Text Theme
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: appColors.textDark),
    bodyMedium: TextStyle(color: appColors.textDark),
    bodySmall: TextStyle(color: appColors.textDark),
    titleLarge: TextStyle(color: appColors.primaryColor, fontWeight: FontWeight.bold),
    titleMedium: TextStyle(color: appColors.textDark),
    labelLarge: TextStyle(color: appColors.primaryColor),
    labelMedium: TextStyle(color: appColors.textGrey),
  ),
);


/// 🔹 Dark Theme
final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  primaryColor: appColors.primaryColor,
  scaffoldBackgroundColor: appColors.backgroundDark,

  colorScheme: ColorScheme.dark(
    primary: appColors.primaryColor,
    secondary: appColors.yellow,
    surface: Colors.grey[900]!,
    onPrimary: appColors.textLight,
    onSurface: appColors.textLight,
  ),

  appBarTheme: AppBarTheme(
    backgroundColor: appColors.primaryColor,
    elevation: 2,
    titleTextStyle: TextStyle(
      color: appColors.textLight,
      fontSize: 22,
      fontWeight: FontWeight.w500,
    ),
    iconTheme: IconThemeData(color: appColors.textLight),
  ),

  /// ✅ Bottom Navigation Theme
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: const Color(0xFF1E1E1E),
    selectedItemColor: appColors.primaryLight,
    unselectedItemColor: Colors.grey[500],
    showUnselectedLabels: true,
    type: BottomNavigationBarType.fixed,
  ),
  //
  // bottomAppBarTheme: BottomAppBarTheme(
  //   color: const Color(0xFF1E1E1E),
  //   elevation: 8,
  // ),

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
    labelMedium: TextStyle(color: appColors.textGrey),
  ),
);
