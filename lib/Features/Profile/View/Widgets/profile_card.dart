import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/Shared/ui/images/svg_display.dart';
import '../../../../Core/Theme/Colors/app_colors.dart';
import '../../../../Core/Theme/text/text_style.dart';

class ProfileCard extends StatelessWidget {
  final Color bgColor;
  final IconData icon;
  final Widget title;
  final Widget? subTitle;
  final String? money;
  final String svgPath;
  final LinearGradient? gradient;
  const ProfileCard({
    super.key,
    required this.bgColor,
    required this.icon,
    required this.title,
    this.subTitle,
    this.money,
    required this.svgPath,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 111.w,
      height: 75.h,
      child: Stack(
        children: [
          Container(
            padding:
                EdgeInsets.only(top: 4.h, bottom: 7.h, left: 10.w, right: 10.w),
            width: 111.w,
            height: 60.h,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    title,
                    SvgDisplay(
                      path: svgPath,
                      color: gradient == null
                          ? Colors.white
                          : AppColors.secondaryColor,
                      size: const Size(20, 20),
                    ),
                  ],
                ),
                const Spacer(),
                subTitle ??
                    Column(
                      children: [
                        Container(
                          decoration: bgColor != Colors.white
                              ? BoxDecoration(
                                  color: Colors.white.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.2),
                                  ),
                                )
                              : BoxDecoration(
                                  color:
                                      AppColors.primaryColor.withOpacity(0.05),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: AppColors.secondaryColor
                                        .withOpacity(0.2),
                                  ),
                                ),
                          child: Center(
                            child: Text(
                              money!,
                              style: AppTextStyle.subheadline.copyWith(
                                  color: bgColor == Colors.white
                                      ? AppColors.secondaryColor
                                      : Colors.white),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'ر.س',
                              style: AppTextStyle.bodyMedium.copyWith(
                                  color: bgColor == Colors.white
                                      ? AppColors.secondaryColor
                                      : Colors.white,
                                  fontSize: 10.sp),
                            ),
                          ],
                        )
                      ],
                    ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.113,
            width: MediaQuery.of(context).size.width * 0.28,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: gradient == null ? Colors.white : null,
                gradient: gradient,
              ),
              child: Icon(
                icon,
                size: gradient == null ? 28 : 18,
                color: gradient == null ? AppColors.primaryColor : Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
