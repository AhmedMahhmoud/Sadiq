import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/Paths/svg_icons_paths.dart';
import 'package:sadiq/Core/Shared/ui/buttons/rounded/rounded_button.dart';
import 'package:sadiq/Core/Shared/ui/buttons/rounded/rounded_svg_container.dart';
import 'package:sadiq/Core/Shared/ui/images/svg_display.dart';
import 'package:sadiq/Core/Theme/Colors/app_colors.dart';
import 'package:sadiq/Core/Theme/text/text_style.dart';
import 'package:sadiq/Features/BottomNav/bloc/home_bloc.dart';
import 'package:sadiq/Features/Home/View/MyOrders/View/Screens/change_order_status.dart';
import 'package:sadiq/Features/Home/View/MyOrders/cubit/order_details_stepper_cubit.dart';
import 'package:sadiq/Routes/routes.dart';

class ActiveOrdersDisplay extends StatelessWidget {
  const ActiveOrdersDisplay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: Container(
        height: 220,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(
                width: 1, color: AppColors.secondaryColor.withOpacity(0.20)),
            color: AppColors.primaryColor.withOpacity(0.05)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'الحالة',
                    style: AppTextStyle.bodyBold.copyWith(
                      fontSize: 12.sp,
                    ),
                  ),
                  Text(
                    '٠٢٣٢١٧٨٥#',
                    style: AppTextStyle.bodyBold.copyWith(
                        fontSize: 14.sp, fontWeight: FontWeight.normal),
                  )
                ],
              ),
              const Divider(thickness: 1),
              Row(
                children: [
                  SvgDisplay(
                    path: SvgAssetsPaths.deliveryMan,
                    size: Size(15.w, 15.h),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'في طريق للاستلام',
                    style: AppTextStyle.smallBodyBold
                        .copyWith(color: AppColors.primaryColor),
                  ),
                  Expanded(child: Container()),
                  Text(
                    'متبقي ساعة و ٢٣ دقيقة',
                    style: AppTextStyle.smallBodyBold.copyWith(
                        color: AppColors.secondaryColor.withOpacity(0.50),
                        fontSize: 11.sp),
                  )
                ],
              ),
              const Divider(
                thickness: 1,
              ),
              Row(
                children: [
                  const RoundedSvgContainer(
                    borderColor: AppColors.secondaryColor,
                    backgroundColor: AppColors.primaryColor,
                    borderWidth: 2,
                    size: 35,
                    svgPath: SvgAssetsPaths.gradientBox,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'الوجهة ١',
                        style: AppTextStyle.smallBodyBold.copyWith(
                          color: AppColors.primaryColor,
                          fontSize: 12.sp,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'موقع الاستلام',
                            style: AppTextStyle.smallBodyBold.copyWith(
                              fontSize: 12.sp,
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            'اليوم ١١:١٥ ص',
                            style: AppTextStyle.smallBodyBold.copyWith(
                                fontSize: 12.sp,
                                color:
                                    AppColors.secondaryColor.withOpacity(0.50)),
                          ),
                        ],
                      ),
                      Text(
                        'اسم الشارع، اسم الحي، المدينة',
                        style: AppTextStyle.smallBody.copyWith(
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const Spacer(),
              Center(
                child: RoundedButton(
                  onPressed: () {
                    context.read<OrderDetailsStepperCubit>().resetCubit();
                    Navigator.pushNamed(context, AppRoutes.changeOrderStatus);
                  },
                  style: AppTextStyle.bodyBold
                      .copyWith(color: Colors.white, fontSize: 14),
                  title: 'تحديث الحالة',
                  iconWidget: const SvgDisplay(
                      path: SvgAssetsPaths.refresh, size: Size(15, 15)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
