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
      onSurface: SkipassColors.surfaceColor,
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

  static Color getSubtitleColor(BuildContext context) =>
      View.of(context).platformDispatcher.platformBrightness == Brightness.light
          ? Colors.grey.shade300
          : Colors.grey.shade500;

  static Color getBgColor(BuildContext context) =>
      View.of(context).platformDispatcher.platformBrightness == Brightness.light
          ? SkipassColors.lightColor
          : SkipassColors.darkColor;

  static dynamic getSpaciousBgColor(BuildContext context) =>
      View.of(context).platformDispatcher.platformBrightness == Brightness.light
          ? Colors.grey[300]
          : Colors.grey[800];

  static dynamic getSpaciousBgColorReverse(BuildContext context) =>
      View.of(context).platformDispatcher.platformBrightness == Brightness.light
          ? Colors.grey[800]
          : Colors.grey[300];

  static Color getItemTextColor(BuildContext context) =>
      View.of(context).platformDispatcher.platformBrightness == Brightness.light
          ? const Color.fromARGB(255, 237, 239, 253)
          : const Color.fromARGB(255, 237, 239, 253);
}
