import 'package:flutter/material.dart';

class NomadTextTheme {
  NomadTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    bodyMedium: TextStyle(fontFamily: 'Segoe', color: Colors.black),
    headlineLarge: TextStyle(fontFamily: 'Segoe', color: Colors.black),
    headlineMedium: TextStyle(fontFamily: 'Segoe', color: Colors.black),
  );

  static TextTheme darkTextTheme = TextTheme(
    bodyMedium: TextStyle(fontFamily: 'Segoe', color: Colors.white),
    headlineLarge: TextStyle(fontFamily: 'Segoe', color: Colors.white),
    headlineMedium: TextStyle(fontFamily: 'Segoe', color: Colors.white),
  );
}
