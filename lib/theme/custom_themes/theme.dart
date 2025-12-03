import 'package:flutter/material.dart';
import 'package:nomad/theme/custom_themes/colors.dart';
import 'package:nomad/theme/text_theme/text_theme.dart';

class NomadAppTheme {
  NomadAppTheme._();

  static ThemeData lightTheme = ThemeData(
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: primaryFocusColor.withValues(alpha: 0.3),
      selectionHandleColor: primaryFocusColor,
    ),

    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(
      primary: primaryColor,
      onPrimary: secondaryColor,
      surface: secondaryColor,
      onSurface: secondaryFocusColor,
    ),
    fontFamily: 'lexend',
    textTheme: NomadTextTheme.lightTextTheme,
    useMaterial3: true,
  );
  static ThemeData darkTheme = ThemeData(
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: primaryFocusColor.withValues(alpha: 0.3),
      selectionHandleColor: primaryFocusColor,
    ),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    colorScheme: ColorScheme.dark(
      primary: primaryColor,
      onPrimary: secondaryFocusColor,
      surface: secondaryColor,
      onSurface: secondaryFocusColor,
    ),
    fontFamily: 'lexend',
    textTheme: NomadTextTheme.darkTextTheme,
    useMaterial3: true,
  );
}
