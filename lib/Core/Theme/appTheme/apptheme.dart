import 'package:flutter/material.dart';
import 'package:sadiq/Core/Theme/Colors/app_colors.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    useMaterial3: false,
    primaryColor: AppColors.primaryColor,
    hintColor: AppColors.secondaryColor,
    fontFamily: 'DIN',
    buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
  );
}
