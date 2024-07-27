import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/Theme/Colors/app_colors.dart';

class AppTextStyle {
  AppTextStyle._();

  // Font family
  static const String fontFamily = "DIN";
  //Default font color
  static const defaultColor = AppColors.secondaryColor;

  // Font styles
  static TextStyle title1 = TextStyle(
      fontSize: 50.sp,
      fontWeight: FontWeight.w700,
      fontFamily: fontFamily,
      color: defaultColor);

  static TextStyle title2 = TextStyle(
      fontSize: 47.sp,
      fontWeight: FontWeight.w700,
      fontFamily: fontFamily,
      color: defaultColor);

  static TextStyle title3 = TextStyle(
    fontSize: 34.sp,
    fontWeight: FontWeight.w700,
    color: defaultColor,
    fontFamily: fontFamily,
  );

  static TextStyle headline = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: defaultColor,
    fontFamily: fontFamily,
  );

  static TextStyle subheadline = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
    color: defaultColor,
    fontFamily: fontFamily,
  );

  static TextStyle body = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.normal,
    color: defaultColor,
    fontFamily: fontFamily,
  );

  static TextStyle bodyBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    color: defaultColor,
    fontFamily: fontFamily,
  );
  static TextStyle bodyMedium = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: defaultColor,
    fontFamily: fontFamily,
  );
  static TextStyle bodyHeavyBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w900,
    color: defaultColor,
    fontFamily: fontFamily,
  );
  static TextStyle largeBodyBold = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    color: defaultColor,
    fontFamily: fontFamily,
  );
  static TextStyle largeBodyMedium = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w500,
    fontFamily: fontFamily,
    color: defaultColor,
  );
  static TextStyle largeBodyHeavyBold = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w900,
    fontFamily: fontFamily,
    color: defaultColor,
  );
  static TextStyle smallBody = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: defaultColor,
    fontFamily: fontFamily,
  );

  static TextStyle smallBodyBold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
    color: defaultColor,
  );
  static TextStyle smallBodyHeavyBold = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w700,
    color: defaultColor,
    fontFamily: fontFamily,
  );

  static TextStyle caption = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w700,
    color: defaultColor,
    fontFamily: fontFamily,
  );

  static TextStyle buttonLarge = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
    color: defaultColor,
  );

  static TextStyle buttonMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w800,
    fontFamily: fontFamily,
    color: defaultColor,
  );

  static TextStyle buttonSmall = TextStyle(
    fontSize: 12.sp,
    color: defaultColor,
    fontWeight: FontWeight.w800,
    fontFamily: fontFamily,
  );
}
