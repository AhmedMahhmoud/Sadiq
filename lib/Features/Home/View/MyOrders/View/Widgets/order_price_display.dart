import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/Theme/Colors/app_colors.dart';
import 'package:sadiq/Core/Theme/text/text_style.dart';

class PriceDisplay extends StatelessWidget {
  const PriceDisplay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 359,
        height: 148,
        decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.05),
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
                width: 1, color: AppColors.secondaryColor.withOpacity(0.20))),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'التكلفة',
                style: AppTextStyle.bodyBold,
              ),
              const Divider(
                thickness: 1,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'الطلب',
                            style: AppTextStyle.smallBody,
                          ),
                          Text('٣٠ ر.س', style: AppTextStyle.smallBody),
                        ],
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'التوصيل',
                          style: AppTextStyle.smallBody,
                        ),
                        Text('١٠ ر.س', style: AppTextStyle.smallBody),
                      ],
                    ),
                  )
                ],
              ),
              const Divider(
                thickness: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'اجمالي',
                    style: AppTextStyle.bodyBold
                        .copyWith(color: AppColors.primaryColor),
                  ),
                  Text(
                    '٤٠ ر.س',
                    style: AppTextStyle.bodyBold
                        .copyWith(color: AppColors.primaryColor),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
