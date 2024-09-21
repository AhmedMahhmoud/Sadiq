import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/Shared/ui/secondary_app_bar.dart';

import '../../../Core/Shared/ui/Pickers/custom_date_picker_widget.dart';
import '../../../Core/Shared/ui/buttons/back_btn.dart';
import '../../../Core/Shared/ui/cards/home_rounded_bottom_card.dart';
import '../../../Core/Theme/Colors/app_colors.dart';
import '../../../Core/Theme/text/text_style.dart';
import '../../Authentication/Presentation/widgets/login_checkmark.dart';
import '../../Home/View/MyOrders/View/Widgets/order_table_view.dart';

class EarningsScreen extends StatelessWidget {
  const EarningsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeRoundedBottomCard(
          height: 55.h,
          widget: Column(
            children: [
              const SecondaryAppHeader(
                bgColor: Colors.white,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            SizedBox(height: 5.h),
                            Text(
                              'الأرباح',
                              style: AppTextStyle.headline.copyWith(
                                  color: AppColors.secondaryColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const BackBtn(
                          height: 35,
                          iconSize: 22,
                          width: 35,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const TotalMoneyCard(
                          title: 'الدفعات\nالقادمة',
                          amount: '١،٥٠٠',
                        ),
                        SizedBox(width: 5.w),
                        const TotalMoneyCard(
                          title: 'اجمالي\nالأرباح',
                          amount: '١،٥٠٠',
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 15.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomDatePickerButton(
                        title: 'من', initialDate: DateTime.now()),
                    SizedBox(width: 15.w),
                    CustomDatePickerButton(
                        title: 'الي', initialDate: DateTime.now()),
                    SizedBox(width: 12.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15.h,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const LoginCheckmark(),
                              SizedBox(width: 5.w),
                              Text(
                                'تم الدفع',
                                style: AppTextStyle.smallBody
                                    .copyWith(color: AppColors.secondaryColor),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const LoginCheckmark(),
                              SizedBox(width: 5.w),
                              Text(
                                'القادمة',
                                style: AppTextStyle.smallBody
                                    .copyWith(color: AppColors.secondaryColor),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.50,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: const [
                      OrdersTableView(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class TotalMoneyCard extends StatelessWidget {
  final String title;
  final String amount;
  const TotalMoneyCard({
    super.key,
    required this.title,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 7.h),
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.07),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Text(
              title,
              style: AppTextStyle.caption
                  .copyWith(color: AppColors.primaryColor, fontSize: 10.sp),
            ),
            SizedBox(width: 17.w),
            Container(
              height: 16.h,
              padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 2.h),
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.05),
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: AppColors.secondaryColor.withOpacity(0.2),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    amount,
                    style: AppTextStyle.subheadline
                        .copyWith(color: AppColors.secondaryColor),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    'ر.س',
                    style: AppTextStyle.bodyMedium.copyWith(
                        color: AppColors.secondaryColor, fontSize: 10.sp),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
