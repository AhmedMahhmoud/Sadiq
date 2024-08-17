import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/Theme/Colors/app_colors.dart';
import 'package:sadiq/Core/Theme/text/text_style.dart';

class CustomOutlineButton extends StatelessWidget {
  final Size? size;
  final Function onPress;
  final String text;
  final Widget? icon;
  final Color? borderColor;
  final Color? textColor;
  final Color? backgroundColor;
  final double borderRadius;
  final double borderWidth;
  final EdgeInsetsGeometry? padding;

  const CustomOutlineButton({
    this.size,
    required this.onPress,
    required this.text,
    this.icon,
    this.borderColor,
    this.textColor,
    this.backgroundColor,
    this.borderRadius = 60,
    this.borderWidth = 1,
    this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: padding ?? EdgeInsets.only(left: 5.w),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          width: size?.width ?? 320.w,
          height: size?.height ?? 55.h,
          decoration: BoxDecoration(
            border: Border.all(
              width: borderWidth,
              color: borderColor ?? AppColors.primaryColor,
            ),
            borderRadius: BorderRadius.circular(borderRadius),
            color: backgroundColor,
          ),
          child: InkWell(
            onTap: () => onPress(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) ...[
                  icon!,
                  const SizedBox(width: 10),
                ],
                Text(
                  text,
                  style: AppTextStyle.smallBodyBold.copyWith(
                    color: textColor ?? AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
