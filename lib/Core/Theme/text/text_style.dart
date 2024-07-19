import 'package:flutter/material.dart';

class AppTextStyle {
  AppTextStyle._();

  // Font family
  static const String fontFamily = "DIN";

  // Font styles
  static const TextStyle title1 = TextStyle(
    fontSize: 60,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
  );

  static const TextStyle title2 = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
  );

  static const TextStyle title3 = TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
  );

  static const TextStyle headline = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w800,
    fontFamily: fontFamily,
  );

  static const TextStyle subheadline = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w800,
    fontFamily: fontFamily,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    fontFamily: fontFamily,
  );

  static const TextStyle bodyBold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
  );
  static const TextStyle bodyHeavyBold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w900,
    fontFamily: fontFamily,
  );
  static const TextStyle smallBody = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    fontFamily: fontFamily,
  );

  static const TextStyle smallBodyBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
  );
  static const TextStyle smallBodyHeavyBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
  );

  static const TextStyle buttonLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
  );

  static const TextStyle buttonMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w800,
    fontFamily: fontFamily,
  );

  static const TextStyle buttonSmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w800,
    fontFamily: fontFamily,
  );
}
