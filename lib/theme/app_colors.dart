import 'package:flutter/material.dart';

class AppColors {
  /// Brand Colors
  final Color primaryColor = const Color(0xFF3E1F66);
  final Color primaryLight = const Color(0xFFCC401D5D);
  final Color primaryDark = const Color(0xFF3E1F66);
  final Color primaryMoreLight = const Color(0xFF99401D5D);
  final Color primaryLightDark = const Color(0xFFCC4D267A);
  final Color primaryMoreLight2 = const Color(0xFF8660A5);
  final Color primary80 = const Color(0xFFCC4D267A);
  final Color primary50 = const Color(0xFF804D267A);
  final Color primary20 = const Color(0xFF334D267A);
  final Color primaryAlpha = const Color(0xFFDC401D5D);
  final Color ProfileAvtar = const Color(0xff203752);
  final Color yellow = const Color(0xFFFFD54F);   // beautiful yellow
  final Color yellowDark = const Color(0xFFFFC107); // dark theme match

  /// Static Colors
  static const Color primary = Color(0xFF4CAF50);
  static const Color secondary = Color(0xFF2196F3);
  static const Color containerBg = Color(0xFFF5F5F5);

  /// Latest News Widget Colors
  final Color latestNewsBg = const Color(0xFFF3EFFF);
  final Color latestNewsLabelBg = const Color(0xFFFFD54F);
  final Color latestNewsText = const Color(0xFF000000);

  /// Background Colors
  final Color backgroundLight = Colors.white;
  final Color backgroundDark = Colors.black;

  /// Text Colors
  final Color textDark = Colors.black;
  final Color textLight = Colors.white;
  final Color textPrimary = const Color(0xFF3E1F66);
  final Color textGrey = const Color(0xffE0E0E0);

  /// Neutral Colors
  final Color gray = const Color(0xFF757575);
  final Color lightGray = const Color(0xFFF5F5F5);
  final Color borderColor = const Color(0xFFE0E0E0);

  /// Accent Colors
  final Color success = const Color(0xFF43A047);
  final Color error = const Color(0xFFE53935);
  final Color warning = const Color(0xFFFFA726);

  /// Avatar Colors
  final Color avatarPurple = const Color(0xFF4D267A);

  // ---------------------------------------------------------
  // 🚀 NEW COLORS ADDED FOR YOUR UI (Services + Gradient UI)
  // ---------------------------------------------------------

  /// Top Services Gradient (Add Money, Send Money... UI)
  final Color serviceGradientStart = const Color(0xFFD1C3EB);
  final Color serviceGradientEnd = const Color(0xFFAB85F2);

  /// White Shadow Service Container
  final Color serviceCardBg = const Color(0xFFFFFFFF);

  /// Light Icon Background
  final Color serviceIconBg = const Color(0xFFF3EFFF);

  /// Tab Gradient (same theme as screenshot)
  final Color tabGradientStart = const Color(0xFF7B1FA2);
  final Color tabGradientEnd = const Color(0xFF9C27B0);

  /// Common shadow
  final Color shadowColor = Colors.black12;
}

final appColors = AppColors();
