import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/Paths/svg_icons_paths.dart';
import 'package:sadiq/Core/Shared/map/map_display.dart';
import 'package:sadiq/Core/Shared/ui/buttons/rounded/rounded_button.dart';
import 'package:sadiq/Core/Shared/ui/images/svg_display.dart';
import 'package:sadiq/Core/Theme/Colors/app_colors.dart';
import 'package:sadiq/Core/Theme/text/text_style.dart';
import 'package:sadiq/Features/Home/View/MyOrders/View/Screens/change_order_status.dart';
import 'package:sadiq/Features/Home/View/MyOrders/View/Widgets/dekivery_location_btn.dart';
import 'package:sadiq/Features/Home/View/MyOrders/View/Widgets/distance_time_indicator.dart';
import 'package:sadiq/Features/Home/View/MyOrders/View/Widgets/driver_call_button.dart';
import 'package:sadiq/Features/Home/View/MyOrders/View/Widgets/order_stepper.dart';
import 'package:sadiq/Features/Home/View/MyOrders/cubit/order_details_stepper_cubit.dart';

class DeliverylocationPage extends StatefulWidget {
  const DeliverylocationPage({
    super.key,
  });

  @override
  State<DeliverylocationPage> createState() => _DeliverylocationPageState();
}

class _DeliverylocationPageState extends State<DeliverylocationPage> {
  bool startDelivering = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.iconsBackgroundColor.withOpacity(0.3),
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height * 0.62,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'الوجهة ١',
                  style: AppTextStyle.smallBodyBold
                      .copyWith(color: AppColors.primaryColor),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'موقع الاستلام',
                      style: AppTextStyle.bodyBold.copyWith(fontSize: 14.sp),
                    ),
                    Text(
                      'اسم الشارع، اسم الحي، المدينة',
                      style: AppTextStyle.smallBody,
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: DrivierCallButton(
                onTapp: () {},
                btnSize: const Size(358, 50),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: const SizedBox(
                      width: 360,
                      height: 180,
                      child: MapViewDisplay(),
                    ),
                  ),
                  Positioned(
                      child: DistanceTimeIndicator(
                          bgColor: Colors.white,
                          style: AppTextStyle.smallBodyBold.copyWith(
                              color: AppColors.primaryColor, fontSize: 10.sp),
                          distance: 'أنت على بعد ٢٥ كم',
                          time: 'ساعة و ٢٣ دقيقة')),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomOutlineButton(
              text: 'التوجه إلي مكان الاستلام',
              icon: const SvgDisplay(path: SvgAssetsPaths.deliveryMan),
              onPress: () {
                setState(() {
                  startDelivering = true;
                });
              },
              size: const Size(358, 50),
            ),
            const Spacer(),
            Center(
                child: RoundedButton(
              onPressed: () {
                context.read<OrderDetailsStepperCubit>().changeStep(1);
              },
              title: 'تم الوصول',
              isEnabled: startDelivering,
              style: AppTextStyle.smallBodyBold.copyWith(color: Colors.white),
              btnSize: const Size(225, 42),
              iconWidget: const SvgDisplay(
                  path: SvgAssetsPaths.completed,
                  color: Colors.white,
                  size: Size(16, 16)),
            ))
          ],
        ),
      ),
    );
  }
}
