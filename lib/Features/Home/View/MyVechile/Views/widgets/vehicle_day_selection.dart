import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/Theme/Colors/app_colors.dart';
import 'package:sadiq/Core/Theme/text/text_style.dart';
import 'package:sadiq/Core/extenstions/date_extenstion.dart';
import 'package:sadiq/Features/Home/View/MyVechile/Views/widgets/months_dropdown.dart';

class VehicleDaySelection extends StatelessWidget {
  const VehicleDaySelection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'اليوم',
              style: AppTextStyle.largeBodyBold,
            ),
            Text(
              DateTime.now().toYMD(),
              style: AppTextStyle.bodyBold
                  .copyWith(color: AppColors.primaryColor, fontSize: 14.sp),
            ),
          ],
        ),
        const MonthDropdown()
      ],
    );
  }
}
