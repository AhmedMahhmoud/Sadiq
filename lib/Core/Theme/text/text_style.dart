import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
  AppTextStyle._();

  // Font family
  static const String fontFamily = "DIN";

  // Font styles
  static TextStyle title1 = TextStyle(
    fontSize: 50.sp,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
  );

  static TextStyle title2 = TextStyle(
    fontSize: 47.sp,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
  );

  static TextStyle title3 = TextStyle(
    fontSize: 34.sp,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
  );

  static TextStyle headline = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w800,
    fontFamily: fontFamily,
  );

  static TextStyle subheadline = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w800,
    fontFamily: fontFamily,
  );

  static TextStyle body = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.normal,
    fontFamily: fontFamily,
  );

  static TextStyle bodyBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
  );
  static TextStyle bodyMedium = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    fontFamily: fontFamily,
  );
  static TextStyle bodyHeavyBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w900,
    fontFamily: fontFamily,
  );
  static TextStyle largeBodyBold = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
  );
  static TextStyle largeBodyMedium = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w500,
    fontFamily: fontFamily,
  );
  static TextStyle largeBodyHeavyBold = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w900,
    fontFamily: fontFamily,
  );
  static TextStyle smallBody = TextStyle(
    fontSize: 14.sp.sp,
    fontWeight: FontWeight.normal,
    fontFamily: fontFamily,
  );

  static TextStyle smallBodyBold = TextStyle(
    fontSize: 14.sp.sp,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
  );
  static TextStyle smallBodyHeavyBold = TextStyle(
    fontSize: 14.sp.sp,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
  );

  static TextStyle caption = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
  );

  static TextStyle buttonLarge = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
  );

  static TextStyle buttonMedium = TextStyle(
    fontSize: 14.sp.sp,
    fontWeight: FontWeight.w800,
    fontFamily: fontFamily,
  );

  static TextStyle buttonSmall = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w800,
    fontFamily: fontFamily,
  );
}
