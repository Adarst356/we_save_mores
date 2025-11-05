import 'package:flutter/material.dart';

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
        this.color, this.overflow,
      });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        overflow: overflow,
        letterSpacing: letterSpacing,
        height: height,
        decoration: decoration,
        fontFamily: fontFamily,
      ),
    );
  }
}