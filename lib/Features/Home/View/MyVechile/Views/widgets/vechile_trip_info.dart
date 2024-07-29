import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/Shared/ui/images/svg_display.dart';
import 'package:sadiq/Core/Shared/ui/form/gradient_text.dart';
import 'package:sadiq/Core/Theme/Colors/app_colors.dart';
import 'package:sadiq/Core/Theme/text/text_style.dart';

class VechileTripInfo extends StatelessWidget {
  final String title;
  final String icon;
  final String value;
  final String valueType;

  const VechileTripInfo({
    required this.icon,
    required this.title,
    required this.value,
    required this.valueType,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              width: 25,
              child: SvgDisplay(
                path: icon,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: AppTextStyle.largeBodyMedium
                  .copyWith(fontSize: 18, fontWeight: FontWeight.w400),
            )
          ],
        ),
        SizedBox(
          width: 89.w,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              GradientText(
                label: value,
                style: AppTextStyle.title3.copyWith(fontSize: 30.sp),
              ),
              SizedBox(
                width: 30.w,
              ),
              SizedBox(
                height: 15.h,
                child: Text(
                  valueType,
                  style: AppTextStyle.smallBodyBold.copyWith(
                      color: AppColors.secondaryColor.withOpacity(0.4)),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
