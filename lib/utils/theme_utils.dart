import 'package:flutter/material.dart';
import 'package:suffa_skipass/core/resources/skipass_color.dart';
import 'package:suffa_skipass/core/resources/skipass_fonts.dart';

class SkipassThemeUtils {
  // light theme
  static final lightTheme = ThemeData(
    fontFamily: SkipassFonts.fontName,
    brightness: Brightness.light,
    scaffoldBackgroundColor: SkipassColors.lightColor,
    colorScheme: const ColorScheme.light().copyWith(
      primary: SkipassColors.primaryColor,
      secondary: SkipassColors.secondaryColor,
      onSurface: SkipassColors.surfaceColor,
    ),
  );

  static final darkTheme = ThemeData(
    fontFamily: SkipassFonts.fontName,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: SkipassColors.darkColor,
    colorScheme: const ColorScheme.dark().copyWith(
      primary: SkipassColors.primaryColor,
      secondary: SkipassColors.secondaryColor,
      onSurface: SkipassColors.lightColor,
    ),
  );

  static Color getContentBackgroundColor(BuildContext context) =>
      View.of(context).platformDispatcher.platformBrightness == Brightness.light
          ? SkipassColors.primaryColor
          : SkipassColors.secondaryColor;

  static Color getContentPickupColor(BuildContext context) =>
      View.of(context).platformDispatcher.platformBrightness == Brightness.light
          ? SkipassColors.secondaryColor
          : SkipassColors.lightColor;

  static Color getHeaderTextColor(BuildContext context) =>
      View.of(context).platformDispatcher.platformBrightness == Brightness.light
          ? SkipassColors.lightColor
          : SkipassColors.lightW100Color;
}
