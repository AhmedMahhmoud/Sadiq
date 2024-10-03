import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/Theme/Colors/app_colors.dart';
import 'package:sadiq/Core/Theme/text/text_style.dart';
import 'package:sadiq/Core/extenstions/date_extenstion.dart';
import 'package:sadiq/Features/Home/View/MyOrders/View/Widgets/distance_time_indicator.dart';
import 'package:sadiq/Features/Home/View/MyOrders/View/Widgets/distance_time_vertical_dots.dart';
import 'package:sadiq/Features/shipments/data/models/shipments_model.dart';

class NewOrdersDisplay extends StatelessWidget {
  final Shipment newShipment;
  const NewOrdersDisplay({
    required this.newShipment,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5),
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
            newShipment.title ?? '',
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
              const DistanceTimeVerticalDots(noOfLines: 4),
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
                      SizedBox(
                        width: 5.w,
                      ),
                      SizedBox(
                        width: 140.w,
                        child: Text(
                          newShipment.receivingDateTime ?? '',
                          style: AppTextStyle.smallBodyBold.copyWith(
                              fontSize: 11.sp,
                              color: AppColors.secondaryColor.withOpacity(0.5)),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    newShipment.receivingAddress ?? '',
                    style: AppTextStyle.smallBody.copyWith(fontSize: 12.sp),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  CenteredDistanceTimeIndicatorContent(
                    distance: '٢٥ كم',
                    time: 'ساعة و ٢٣ دقيقة',
                    style: AppTextStyle.smallBody.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor),
                  ),
                  Text(
                    'موقع التسليم',
                    style: AppTextStyle.smallBodyBold,
                  ),
                  Text(
                    newShipment.deliveryAddress ?? '',
                    style: AppTextStyle.smallBody.copyWith(fontSize: 12.sp),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
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
