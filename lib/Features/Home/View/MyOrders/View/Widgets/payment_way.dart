import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/Theme/Colors/app_colors.dart';
import 'package:sadiq/Core/Theme/text/text_style.dart';

class PaymentWay extends StatelessWidget {
  const PaymentWay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            width: 359,
            height: 60,
            decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.05),
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                    width: 1,
                    color: AppColors.secondaryColor.withOpacity(0.20))),
            child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'طريقة الدفع',
                        style: AppTextStyle.bodyBold,
                      ),
                      Text(
                        'كاش',
                        style: AppTextStyle.bodyBold
                            .copyWith(color: AppColors.primaryColor),
                      ),
                    ]))));
  }
}
