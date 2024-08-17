import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/Paths/svg_icons_paths.dart';
import 'package:sadiq/Core/Shared/ui/images/svg_display.dart';

import 'package:sadiq/Core/Theme/Colors/app_colors.dart';
import 'package:sadiq/Core/Theme/text/text_style.dart';

class DrivierCallButton extends StatelessWidget {
  final Function onTapp;
  final Size? btnSize;
  const DrivierCallButton({
    required this.onTapp,
    this.btnSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 5.w),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 15.w,
        ),
        width: btnSize?.width ?? 320.w,
        height: btnSize?.height ?? 55,
        decoration: BoxDecoration(
            border: Border.all(
                width: 1, color: AppColors.secondaryColor.withOpacity(0.20)),
            borderRadius: BorderRadius.circular(60),
            color: AppColors.primaryColor.withOpacity(0.05)),
        child: InkWell(
          onTap: () => onTapp(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'اسم المسؤول عن الشحنة',
                style: AppTextStyle.smallBody,
              ),
              Container(
                width: 90,
                height: 35,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: AppColors.secondaryColor.withOpacity(0.10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SvgDisplay(
                      path: SvgAssetsPaths.phone,
                      color: AppColors.primaryColor,
                      size: Size(15, 15),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                      height: 15.h,
                      child: Text(
                        'اتصل',
                        style: AppTextStyle.smallBodyBold
                            .copyWith(color: AppColors.primaryColor),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
