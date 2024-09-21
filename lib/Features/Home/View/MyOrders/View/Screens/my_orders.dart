import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/Shared/ui/cards/home_rounded_bottom_card.dart';
import 'package:sadiq/Core/Theme/text/text_style.dart';
import 'package:sadiq/Features/Home/View/MyOrders/View/Widgets/new_orders_display.dart';
import 'package:sadiq/Features/Home/View/MyOrders/View/Widgets/orders_filteration.dart';

import '../Widgets/order_table_item_details_bs.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          HomeRoundedBottomCard(
            widget: SizedBox(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'طلبات جديدة (3)',
                      style:
                          AppTextStyle.largeBodyBold.copyWith(fontSize: 24.sp),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Expanded(
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  builder: (context) =>
                                      const OrderItemDetailsBS(
                                          isNewOrder: true),
                                );
                              },
                              child: const NewOrdersDisplay()),
                        ),
                        separatorBuilder: (context, index) => SizedBox(
                          width: 10.w,
                        ),
                        itemCount: 2,
                      ),
                    )
                  ],
                ),
              ),
            ),
            height: 300,
          ),
          const OrdersFilteration()
        ],
      ),
    );
  }
}
