import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/Paths/svg_icons_paths.dart';
import 'package:sadiq/Core/Shared/ui/buttons/rounded/rounded_button.dart';
import 'package:sadiq/Core/Shared/ui/images/svg_display.dart';
import 'package:sadiq/Core/Theme/Colors/app_colors.dart';
import 'package:sadiq/Core/Theme/text/text_style.dart';
import 'package:sadiq/Features/Home/View/MyOrders/View/Widgets/dekivery_location_btn.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:sadiq/Features/Home/View/MyOrders/View/Widgets/order_price_display.dart';
import 'package:sadiq/Features/Home/View/MyOrders/View/Widgets/payment_way.dart';
import 'package:sadiq/Features/Home/View/MyOrders/View/Widgets/rating_widget.dart';
import 'package:sadiq/Features/Home/View/MyOrders/cubit/order_details_stepper_cubit.dart';

class DeliverOrderPage extends StatefulWidget {
  const DeliverOrderPage({super.key});

  @override
  State<DeliverOrderPage> createState() => _DeliverOrderPageState();
}

class _DeliverOrderPageState extends State<DeliverOrderPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderDetailsStepperCubit, OrderDetailsStepperState>(
      builder: (context, state) {
        bool isDelivered =
            BlocProvider.of<OrderDetailsStepperCubit>(context, listen: true)
                .isDelivered;
        return Container(
          color: AppColors.iconsBackgroundColor.withOpacity(0.3),
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PriceDisplay(),
                SizedBox(
                  height: 10.h,
                ),
                const PaymentWay(),
                SizedBox(
                  height: 5.h,
                ),
                const Divider(
                  thickness: 1,
                ),
                SizedBox(
                  height: 5.h,
                ),
                RatingWidget(
                  initialRating: 0,
                  isEnabled: isDelivered,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Center(
                  child: Container(
                    width: 359,
                    height: 144,
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                            width: 1,
                            color: AppColors.secondaryColor.withOpacity(0.20))),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.w,
                      ),
                      child: TextField(
                        maxLines: null,
                        enabled: isDelivered,
                        onTapOutside: (event) =>
                            FocusScope.of(context).unfocus(),
                        decoration: InputDecoration(
                          hintText: 'اضف ملاحظاتك علي الطلب',
                          hintStyle: AppTextStyle.smallBodyBold.copyWith(
                              color: isDelivered
                                  ? AppColors.primaryColor
                                  : AppColors.primaryColor.withOpacity(0.3),
                              fontSize: 12.sp),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                Center(
                    child: RoundedButton(
                  onPressed: () {
                    if (!isDelivered) {
                      context.read<OrderDetailsStepperCubit>().deliverOrder();
                    } else {
                      Navigator.pop(context);
                    }
                  },
                  title: isDelivered ? 'اضف تقييمك' : 'تم التسليم',
                  style:
                      AppTextStyle.smallBodyBold.copyWith(color: Colors.white),
                  btnSize: const Size(225, 42),
                  iconWidget: const SvgDisplay(
                      path: SvgAssetsPaths.completed,
                      color: Colors.white,
                      size: Size(16, 16)),
                )),
              ],
            ),
          ),
        );
      },
    );
  }
}
