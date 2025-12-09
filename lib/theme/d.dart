import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff006860),
      surfaceTint: Color(0xff006a63),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff00837a),
      onPrimaryContainer: Color(0xfff3fffc),
      secondary: Color(0xff765700),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff946f00),
      onSecondaryContainer: Color(0xfffffbff),
      tertiary: Color(0xffb8183e),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffff516c),
      onTertiaryContainer: Color(0xff5b0017),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfff5faf8),
      onSurface: Color(0xff171d1c),
      onSurfaceVariant: Color(0xff3d4947),
      outline: Color(0xff6d7a77),
      outlineVariant: Color(0xffbcc9c6),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2c3230),
      inversePrimary: Color(0xff69d8cd),
      primaryFixed: Color(0xff86f5e9),
      onPrimaryFixed: Color(0xff00201d),
      primaryFixedDim: Color(0xff69d8cd),
      onPrimaryFixedVariant: Color(0xff00504a),
      secondaryFixed: Color(0xffffdf9e),
      onSecondaryFixed: Color(0xff261a00),
      secondaryFixedDim: Color(0xfff3bf42),
      onSecondaryFixedVariant: Color(0xff5b4300),
      tertiaryFixed: Color(0xffffdadb),
      onTertiaryFixed: Color(0xff40000e),
      tertiaryFixedDim: Color(0xffffb2b7),
      onTertiaryFixedVariant: Color(0xff91002b),
      surfaceDim: Color(0xffd6dbd9),
      surfaceBright: Color(0xfff5faf8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff0f5f3),
      surfaceContainer: Color(0xffeaefed),
      surfaceContainerHigh: Color(0xffe4e9e7),
      surfaceContainerHighest: Color(0xffdee4e2),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }



  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff69d8cd),
      surfaceTint: Color(0xff69d8cd),
      onPrimary: Color(0xff003733),
      primaryContainer: Color(0xff24a197),
      onPrimaryContainer: Color(0xff00211e),
      secondary: Color(0xfff3bf42),
      onSecondary: Color(0xff402d00),
      secondaryContainer: Color(0xffb78901),
      onSecondaryContainer: Color(0xff372700),
      tertiary: Color(0xffffb2b7),
      onTertiary: Color(0xff67001c),
      tertiaryContainer: Color(0xffff516c),
      onTertiaryContainer: Color(0xff5b0017),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff0f1414),
      onSurface: Color(0xffdee4e2),
      onSurfaceVariant: Color(0xffbcc9c6),
      outline: Color(0xff869391),
      outlineVariant: Color(0xff3d4947),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee4e2),
      inversePrimary: Color(0xff006a63),
      primaryFixed: Color(0xff86f5e9),
      onPrimaryFixed: Color(0xff00201d),
      primaryFixedDim: Color(0xff69d8cd),
      onPrimaryFixedVariant: Color(0xff00504a),
      secondaryFixed: Color(0xffffdf9e),
      onSecondaryFixed: Color(0xff261a00),
      secondaryFixedDim: Color(0xfff3bf42),
      onSecondaryFixedVariant: Color(0xff5b4300),
      tertiaryFixed: Color(0xffffdadb),
      onTertiaryFixed: Color(0xff40000e),
      tertiaryFixedDim: Color(0xffffb2b7),
      onTertiaryFixedVariant: Color(0xff91002b),
      surfaceDim: Color(0xff0f1414),
      surfaceBright: Color(0xff353a39),
      surfaceContainerLowest: Color(0xff0a0f0e),
      surfaceContainerLow: Color(0xff171d1c),
      surfaceContainer: Color(0xff1b2120),
      surfaceContainerHigh: Color(0xff252b2a),
      surfaceContainerHighest: Color(0xff303635),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }



  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    scaffoldBackgroundColor: colorScheme.background,
    canvasColor: colorScheme.surface,
  );


}
