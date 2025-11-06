import 'package:flutter/material.dart';

import 'app_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final double borderRadius;
  final double fontSize;
  final FontWeight fontWeight;
  final String fontFamily;

  const CustomButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
    this.backgroundColor,
    this.borderRadius = 12,
    this.fontSize = 22,
    this.fontWeight = FontWeight.w800,
    this.fontFamily = "Poppins",
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? theme.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(borderRadius),
            bottomLeft: Radius.circular(borderRadius),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      onPressed: onPressed,
      icon: Icon(icon, size: 22, color: Colors.white),
      label: AppText(
        text,
        fontSize: fontSize,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        color: Colors.white,
      ),
    );
  }
}
