import 'package:flutter/material.dart';
import 'app_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final double fontSize;
  final FontWeight fontWeight;
  final String fontFamily;

  /// Optional radius for each corner
  final double topLeft;
  final double topRight;
  final double bottomLeft;
  final double bottomRight;

  const CustomButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
    this.backgroundColor,
    this.fontSize = 22,
    this.fontWeight = FontWeight.w800,
    this.fontFamily = "Poppins",

    /// Default rounded on all sides
    this.topLeft = 12,
    this.topRight = 12,
    this.bottomLeft = 12,
    this.bottomRight = 12,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? theme.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topLeft),
            topRight: Radius.circular(topRight),
            bottomLeft: Radius.circular(bottomLeft),
            bottomRight: Radius.circular(bottomRight),
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
