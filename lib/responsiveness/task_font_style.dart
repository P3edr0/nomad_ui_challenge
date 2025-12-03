import 'package:flutter/material.dart';
import 'package:nomad/responsiveness/responsive.dart';

abstract class NomadFontStyle {
  static TextStyle h0 = TextStyle(
    fontFamily: 'Segoe',

    fontSize: Responsive.getFontValue(60),
    color: Colors.black,
  );
  static TextStyle titleLarge = TextStyle(
    fontFamily: 'Segoe',
    height: Responsive.getFontValue(54),
    color: Colors.black,
  );

  static TextStyle h1 = TextStyle(
    fontFamily: 'Segoe',
    fontSize: Responsive.getFontValue(50),
    color: Colors.black,
  );
  static TextStyle h2 = TextStyle(
    fontFamily: 'Segoe',
    fontSize: Responsive.getFontValue(40),
    color: Colors.black,
  );
  static TextStyle h3 = TextStyle(
    fontFamily: 'Segoe',
    fontSize: Responsive.getFontValue(28),
    color: Colors.black,
  );
  static TextStyle h4Large = TextStyle(
    fontFamily: 'Segoe',
    fontSize: Responsive.getFontValue(24),
    color: Colors.black,
  );
  static TextStyle h4 = TextStyle(
    fontFamily: 'Segoe',
    fontSize: Responsive.getFontValue(20),
    color: Colors.black,
  );
  static TextStyle bodyLarge = TextStyle(
    fontFamily: 'Segoe',
    fontSize: Responsive.getFontValue(16),
    color: Colors.black,
  );
  static TextStyle title = TextStyle(
    fontFamily: 'Segoe',
    fontSize: Responsive.getFontValue(18),
    color: Colors.black,
  );
  static TextStyle body = TextStyle(
    fontFamily: 'Segoe',
    fontSize: Responsive.getFontValue(14),
    color: Colors.black,
  );
  static TextStyle small = TextStyle(
    fontFamily: 'Segoe',
    fontSize: Responsive.getFontValue(12),
    color: Colors.black,
  );
  static TextStyle verySmall = TextStyle(
    fontFamily: 'Segoe',
    fontSize: Responsive.getFontValue(10),
    color: Colors.black,
  );
  static TextStyle h0Bold = TextStyle(
    fontFamily: 'Segoe',
    height: Responsive.getFontValue(60),
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
  static TextStyle titleLargeBold = TextStyle(
    fontFamily: 'Segoe',
    height: Responsive.getFontValue(54),
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
  //+++++++++++++++++++  BOLD FONTS +++++++++++++++++++++++++++++++++++++++
  static TextStyle h1Bold = TextStyle(
    fontFamily: 'Segoe',
    fontSize: Responsive.getFontValue(50),
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
  static TextStyle h2Bold = TextStyle(
    fontFamily: 'Segoe',
    fontSize: Responsive.getFontValue(40),
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
  static TextStyle h3Bold = TextStyle(
    fontFamily: 'Segoe',
    fontSize: Responsive.getFontValue(28),
    color: Colors.black,
    fontWeight: FontWeight.w600,
  );
  static TextStyle h4LargeBold = TextStyle(
    fontFamily: 'Segoe',
    fontSize: Responsive.getFontValue(24),
    color: Colors.black,
    fontWeight: FontWeight.w600,
  );
  static TextStyle h4Bold = TextStyle(
    fontFamily: 'Segoe',
    fontSize: Responsive.getFontValue(20),
    color: Colors.black,
    fontWeight: FontWeight.w600,
  );
  static TextStyle bodyLargeBold = TextStyle(
    fontFamily: 'Segoe',
    fontSize: Responsive.getFontValue(16),
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
  static TextStyle titleBold = TextStyle(
    fontFamily: 'Segoe',
    fontSize: Responsive.getFontValue(18),
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
  static TextStyle bodyBold = TextStyle(
    fontFamily: 'Segoe',
    fontSize: Responsive.getFontValue(14),
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  static TextStyle smallBold = TextStyle(
    fontFamily: 'Segoe',
    fontSize: Responsive.getFontValue(12),
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
  static TextStyle verySmallBold = TextStyle(
    fontFamily: 'Segoe',
    fontSize: Responsive.getFontValue(10),
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
}
