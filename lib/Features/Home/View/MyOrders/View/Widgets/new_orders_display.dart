import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/Theme/Colors/app_colors.dart';
import 'package:sadiq/Core/Theme/text/text_style.dart';
import 'package:sadiq/Core/extenstions/date_extenstion.dart';
import 'package:sadiq/Features/Home/View/MyOrders/View/Widgets/distance_time_indicator.dart';
import 'package:sadiq/Features/Home/View/MyOrders/View/Widgets/distance_time_vertical_dots.dart';

class NewOrdersDisplay extends StatelessWidget {
  const NewOrdersDisplay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
              spreadRadius: 2,
              blurRadius: 15,
              color: AppColors.secondaryColor.withOpacity(0.11))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'اسم الشحنة',
            style: AppTextStyle.bodyBold,
          ),
          SizedBox(
            height: 5.h,
          ),
          const DistanceTimeIndicator(
            distance: 'أنت على بعد ٢٥ كم',
            time: 'ساعة و ٢٣ دقيقة',
          ),
          SizedBox(
            height: 5.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DistanceTimeVerticalDots(),
              SizedBox(
                width: 15.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'موقع الإستلام',
                        style: AppTextStyle.smallBodyBold,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        child: SizedBox(
                          width: 140.w,
                          child: Text(
                            DateTime.now().toArabicTime(),
                            style: AppTextStyle.smallBodyBold.copyWith(
                                fontSize: 11.sp,
                                color:
                                    AppColors.secondaryColor.withOpacity(0.5)),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'اسم الشارع، اسم الحي، المدينة',
                    style: AppTextStyle.smallBody.copyWith(fontSize: 12.sp),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  DistanceTimeIndicatorContent(
                    distance: '٢٥ كم',
                    time: 'ساعة و ٢٣ دقيقة',
                    style: AppTextStyle.smallBody.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Text(
                    'موقع الإستلام',
                    style: AppTextStyle.smallBodyBold,
                  ),
                  Text(
                    'اسم الشارع، اسم الحي، المدينة',
                    style: AppTextStyle.smallBody.copyWith(fontSize: 12.sp),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
