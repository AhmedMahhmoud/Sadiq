import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sadiq/Core/Theme/Colors/app_colors.dart';
import 'package:sadiq/Core/Theme/text/text_style.dart';
import 'package:sadiq/Features/Home/View/MyOrders/View/Widgets/orders_filteration.dart';

class OrdersTableView extends StatelessWidget {
  const OrdersTableView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            height: 55,
            width: 358,
            decoration: BoxDecoration(
              color: AppColors.secondaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Text(
                      'التاريخ',
                      style: AppTextStyle.smallBodyBold
                          .copyWith(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Text(
                      'رقم الشحنة',
                      style: AppTextStyle.smallBodyBold
                          .copyWith(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Text(
                      'اسم الشحنة',
                      style: AppTextStyle.smallBodyBold
                          .copyWith(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Text(
                      'الحالة',
                      style: AppTextStyle.smallBodyBold
                          .copyWith(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
          FadeIn(
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.89,
                  height: 200.h,
                  child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, i) {
                        return const OrderTableItem();
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 5.h,
                        );
                      },
                      itemCount: 6),
                ),
                SizedBox(
                  height: 40.h,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
