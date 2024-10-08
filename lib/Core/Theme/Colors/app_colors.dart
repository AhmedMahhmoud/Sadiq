import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xff265CFF);
  static const Color secondaryColor = Color(0xff012087);
  static const Color backgroundOfWhite = Color(0xffF1F1F1);
  static const Color backgroundSecondaryColor = Color(0xffE8EEFF);
  static const Color fieldsBGfillColor = Color(0xffF4F7FF);
  static const Color iconsBackgroundColor = Color(0xffD2E2FF);
  static const Color errorColor = Color(0xffF21A1A);
  static const Color borderColor = Color(0xffB9C3E2);
  static const Color lightGrey = Color(0xffb2bddf);
  static const Color progressColor = Color(0xffCED6F0);
  static Color secondayColorWithOpacity = secondaryColor.withOpacity(0.20);
  static const LinearGradient appLinearGradient = LinearGradient(
      colors: [Color(0xff265CFF), Color(0xff173799)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);
}
