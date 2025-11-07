import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class AppText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? color;
  final TextAlign align;
  final int? maxLines;
  final double? letterSpacing;
  final double? height;
  final TextDecoration? decoration;
  final TextOverflow? overflow;
  final String? fontFamily;
  final bool useThemeColor;

  const AppText(
      this.text, {
        super.key,
        this.fontSize = 14,
        this.fontWeight = FontWeight.normal,
        this.align = TextAlign.start,
        this.maxLines,
        this.letterSpacing,
        this.height,
        this.decoration,
        this.fontFamily,
        this.color,
        this.overflow,
        this.useThemeColor = true,
      });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final effectiveColor = color ??
        (useThemeColor
            ? (theme.brightness == Brightness.dark
            ? appColors.textLight
            : appColors.textDark)
            : appColors.textDark);

    return Text(
      text,
      textAlign: align,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: effectiveColor,
        letterSpacing: letterSpacing,
        height: height,
        decorationColor: effectiveColor,
        decoration: decoration,
        fontFamily: fontFamily,
      ),
    );
  }
}
