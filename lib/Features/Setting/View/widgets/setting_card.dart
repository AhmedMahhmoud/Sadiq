import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/Shared/ui/images/png_display.dart';
import '../../../../Core/Shared/ui/images/svg_display.dart';
import '../../../../Core/Theme/Colors/app_colors.dart';
import '../../../../Core/Theme/text/text_style.dart';

class SettingCard extends StatelessWidget {
  final String title;
  final String icon;
  final bool isSVG;
  final Widget widget;
  const SettingCard({
    super.key,
    required this.title,
    required this.icon,
    required this.isSVG,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 55,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.11),
            blurRadius: 13,
            spreadRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          isSVG
              ? SvgDisplay(
                  path: icon,
                  size: const Size(25, 25),
                  color: AppColors.primaryColor,
                )
              : PngDisplay(
                  path: icon,
                  size: Size(25.w, 13.h),
                ),
          const SizedBox(width: 8),
          Text(
            title,
            style: AppTextStyle.caption
                .copyWith(color: AppColors.secondaryColor, fontSize: 14.sp),
          ),
          const Spacer(),
          widget,
        ],
      ),
    );
  }
}
