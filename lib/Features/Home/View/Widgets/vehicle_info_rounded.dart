import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/Theme/Colors/app_colors.dart';
import 'package:sadiq/Core/Theme/text/text_style.dart';

class VehicleInfoRoundedCard extends StatelessWidget {
  final String title;
  final String value;
  final String valueUnit;
  const VehicleInfoRoundedCard({
    required this.title,
    required this.value,
    required this.valueUnit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 115,
      height: 75,
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColors.borderColor),
          color: AppColors.fieldsBGfillColor,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Center(
              child: Text(
                title,
                style: AppTextStyle.smallBodyBold
                    .copyWith(color: AppColors.primaryColor, fontSize: 12.sp),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider(
            thickness: 1,
            height: 1,
            color: AppColors.borderColor,
          ),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  valueUnit,
                  style: AppTextStyle.smallBody.copyWith(
                      color: AppColors.secondaryColor.withOpacity(0.4)),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Text(value,
                    style: AppTextStyle.largeBodyHeavyBold
                        .copyWith(fontSize: 23.sp)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
