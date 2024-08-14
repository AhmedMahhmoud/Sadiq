import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/Theme/Colors/app_colors.dart';

import '../../../Core/Shared/ui/buttons/back_btn.dart';
import '../../../Core/Theme/text/text_style.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 7.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  SizedBox(height: 5.h),
                  Text(
                    'خطة اشتراكك',
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
          const SubscriptionPlanCard(
            amount: '١،٥٠٠',
            isCurrentPlan: true,
          ),
          Text(
            'خطط اخري',
            style: AppTextStyle.headline.copyWith(
                color: AppColors.secondaryColor, fontWeight: FontWeight.w500),
          ),
          const SubscriptionPlanCard(
            amount: '٢،٥٠٠',
            discountPercentage: '٣٠',
            discountAmount: '٣،٥٠٠',
          ),
        ],
      ),
    );
  }
}

class SubscriptionPlanCard extends StatelessWidget {
  final bool isCurrentPlan;
  final String discountPercentage;
  final String discountAmount;
  final String amount;
  const SubscriptionPlanCard({
    this.isCurrentPlan = false,
    super.key,
    this.discountPercentage = '',
    this.discountAmount = '',
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        discountPercentage != ''
            ? Text(
                'وفر $discountPercentage٪',
                style: AppTextStyle.smallBodyBold
                    .copyWith(color: AppColors.primaryColor),
              )
            : const SizedBox(),
        Container(
          margin: EdgeInsets.symmetric(vertical: 5.h),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.05),
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: AppColors.secondaryColor.withOpacity(0.2),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'شهري',
                    style: AppTextStyle.subheadline.copyWith(
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.w400),
                  ),
                  Column(
                    children: [
                      SizedBox(height: 5.h),
                      Row(
                        children: [
                          Text(
                            discountAmount,
                            style: AppTextStyle.smallBodyBold.copyWith(
                              color: AppColors.secondaryColor.withOpacity(0.4),
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          SizedBox(width: discountAmount == '' ? 0 : 7.w),
                          Container(
                            height: 16.h,
                            padding: EdgeInsets.only(
                                left: 10.w, right: 10.w, bottom: 2.h),
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color:
                                    AppColors.secondaryColor.withOpacity(0.2),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  amount,
                                  style: AppTextStyle.subheadline.copyWith(
                                      color: AppColors.secondaryColor),
                                ),
                                SizedBox(width: 10.w),
                                Text(
                                  'ر.س',
                                  style: AppTextStyle.bodyMedium.copyWith(
                                      color: AppColors.secondaryColor,
                                      fontSize: 10.sp),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: isCurrentPlan ? 7.h : 0),
              isCurrentPlan
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'الخدمة المتبقية ',
                              style: AppTextStyle.caption.copyWith(
                                  color: AppColors.secondaryColor,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              '٢ ايام',
                              style: AppTextStyle.caption.copyWith(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Text(
                          'اللغاء الاشتراك',
                          style: AppTextStyle.caption.copyWith(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    )
                  : const SizedBox(),
              SizedBox(height: 5.h),
            ],
          ),
        ),
      ],
    );
  }
}
