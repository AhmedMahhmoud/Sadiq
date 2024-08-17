import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/Paths/svg_icons_paths.dart';
import 'package:sadiq/Core/Shared/ui/buttons/rounded/circle_icon_button.dart';
import 'package:sadiq/Core/Shared/ui/images/svg_display.dart';
import 'package:sadiq/Core/Shared/ui/secondary_app_bar.dart';
import 'package:sadiq/Core/Theme/Colors/app_colors.dart';
import 'package:sadiq/Core/Theme/text/text_style.dart';
import 'package:sadiq/Features/Home/View/MyOrders/View/Screens/deliver_order_page.dart';
import 'package:sadiq/Features/Home/View/MyOrders/View/Screens/delivery_location_page.dart';
import 'package:sadiq/Features/Home/View/MyOrders/View/Screens/order_recieve_location_page.dart';
import 'package:sadiq/Features/Home/View/MyOrders/View/Screens/recieve_order_page.dart';
import 'package:sadiq/Features/Home/View/MyOrders/View/Widgets/order_stepper.dart';
import 'package:sadiq/Features/Home/View/MyOrders/cubit/order_details_stepper_cubit.dart';

class ChangeOrderStatus extends StatelessWidget {
  const ChangeOrderStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OrderDetailsStepperCubit, OrderDetailsStepperState>(
        builder: (context, state) {
          return ListView(
            children: [
              SecondaryAppHeader(
                  bgColor: Colors.white.withOpacity(0.8), enablePopFirst: true),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ),
                width: MediaQuery.sizeOf(context).width,
                color: Colors.white.withOpacity(0.8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'الحالة الحالية',
                      style: AppTextStyle.smallBodyBold,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const SvgDisplay(
                              path: SvgAssetsPaths.completed,
                              size: Size(20, 20),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              'تم قبول الطلب',
                              style: AppTextStyle.bodyBold
                                  .copyWith(fontSize: 14.sp)
                                  .copyWith(color: AppColors.primaryColor),
                            )
                          ],
                        ),
                        InkWell(
                            onTap: () => Navigator.pop(context),
                            child: const CircleIconButton(
                                iconPath: SvgAssetsPaths.arrowLeft))
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 18,
                        spreadRadius: 5,
                        color: AppColors.secondaryColor.withOpacity(0.11),
                      )
                    ],
                    borderRadius: BorderRadius.circular(10)),
                width: MediaQuery.sizeOf(context).width,
                height: 100.w,
                child: Center(
                  child: DeliveryStepper(activeStep: state.currentStep),
                ),
              ),
              handleStepperPage(state.currentStep)
            ],
          );
        },
      ),
    );
  }

  Widget handleStepperPage(int index) {
    return switch (index) {
      0 => const DeliverylocationPage(),
      1 => const RecieveOrderPage(),
      2 => const OrderRecieveLocationPage(),
      3 => const DeliverOrderPage(),
      _ => const SizedBox()
    };
  }
}
