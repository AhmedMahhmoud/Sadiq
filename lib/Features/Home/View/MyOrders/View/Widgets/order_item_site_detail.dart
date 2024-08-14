import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/Paths/svg_icons_paths.dart';
import 'package:sadiq/Core/Shared/ui/images/svg_display.dart';

import 'package:sadiq/Core/Theme/Colors/app_colors.dart';
import 'package:sadiq/Core/Theme/text/text_style.dart';
import 'package:sadiq/Core/extenstions/date_extenstion.dart';
import 'package:sadiq/Features/Home/View/MyOrders/View/Widgets/driver_call_button.dart';

class OrderItemSiteDetail extends StatelessWidget {
  final String site;
  final bool isDeliveringSite;
  final String timeLeft;
  const OrderItemSiteDetail({
    required this.isDeliveringSite,
    required this.timeLeft,
    required this.site,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          site,
          style: AppTextStyle.body.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.primaryColor,
              fontSize: 13.sp),
        ),
        const SizedBox(height: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 300.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    isDeliveringSite ? 'موقع الاستلام' : 'موقع التسليم',
                    style: AppTextStyle.largeBodyBold.copyWith(fontSize: 13.sp),
                  ),
                  Row(
                    children: [
                      const SvgDisplay(
                          path: SvgAssetsPaths.completed, size: Size(15, 15)),
                      SizedBox(
                        width: 6.w,
                      ),
                      Text(
                        'تم الاستلام',
                        style: AppTextStyle.smallBodyBold.copyWith(
                            fontSize: 13.sp, color: AppColors.primaryColor),
                      )
                    ],
                  )
                ],
              ),
            ),
            Text(
              'اسم الشارع، اسم الحي، المدينة',
              style:
                  AppTextStyle.smallBody.copyWith(fontWeight: FontWeight.w300),
            )
          ],
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Text(
              isDeliveringSite ? 'وقت وتاريخ الاستلام' : 'الوقت المقدر للوصول',
              style: AppTextStyle.body.copyWith(
                  fontSize: 11.sp,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              timeLeft,
              style: AppTextStyle.body
                  .copyWith(fontSize: 11.sp, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Center(
          child: DrivierCallButton(),
        )
      ],
    );
  }
}
