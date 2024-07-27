import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/Shared/ui/text/gradient_text.dart';
import 'package:sadiq/Core/Theme/Colors/app_colors.dart';
import 'package:sadiq/Core/Theme/text/text_style.dart';

class VehickeRemainingDaysDisplay extends StatelessWidget {
  const VehickeRemainingDaysDisplay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'الخدمة المتبقية',
          style: AppTextStyle.body.copyWith(fontSize: 18.sp),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              height: 20.h,
              child: GradientText(
                label: '٢',
                style: AppTextStyle.title3.copyWith(fontSize: 30.sp),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            SizedBox(
              height: 9.h,
              child: Text(
                'ايام',
                style: AppTextStyle.smallBody.copyWith(
                    fontSize: 12.sp,
                    color: AppColors.secondaryColor.withOpacity(0.4)),
              ),
            )
          ],
        )
      ],
    );
  }
}
