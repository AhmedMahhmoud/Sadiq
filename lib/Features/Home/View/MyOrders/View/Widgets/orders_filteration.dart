import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/Shared/ui/Pickers/custom_date_picker_widget.dart';
import 'package:sadiq/Core/Shared/ui/Pickers/custom_dropdown_picker_widget.dart';
import 'package:sadiq/Core/Theme/Colors/app_colors.dart';
import 'package:sadiq/Core/Theme/text/text_style.dart';
import 'package:sadiq/Core/extenstions/date_extenstion.dart';
import 'package:sadiq/Features/Home/View/MyOrders/View/Widgets/active_orders_display.dart';
import 'package:sadiq/Features/Home/View/MyOrders/View/Widgets/order_table_item_details_bs.dart';
import 'package:sadiq/Features/Home/View/MyOrders/View/Widgets/order_table_view.dart';

class OrdersFilteration extends StatefulWidget {
  const OrdersFilteration({Key? key}) : super(key: key);

  @override
  State<OrdersFilteration> createState() => _OrdersFilterationState();
}

class _OrdersFilterationState extends State<OrdersFilteration> {
  int _selectedOrderIndex = 0;

  void _onOrderTap(int index) {
    setState(() {
      _selectedOrderIndex = index;
    });
  }

  Text _buildOrderText(String text, int index) {
    return Text(
      text,
      style: AppTextStyle.bodyBold.copyWith(
        fontSize: 18.sp,
        color: _selectedOrderIndex == index
            ? AppColors.secondaryColor
            : AppColors.secondaryColor.withOpacity(0.2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5),
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.40,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Row(
              children: [
                _buildOrderOption('طلبات فعالة', 0),
                SizedBox(width: 10.w),
                _buildOrderOption('طلبات سابقة', 1),
                SizedBox(width: 10.w),
                _buildOrderCount(),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            _selectedOrderIndex == 0
                ? const ActiveOrdersDisplay()
                : SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomDatePickerButton(
                                title: 'من', initialDate: DateTime.now()),
                            CustomDatePickerButton(
                                title: 'الي', initialDate: DateTime.now()),
                            CustomDropdownButton(
                              title: 'الحالة',
                              items: const ['الجميع', 'منتهي', 'غير منتهي'],
                              initialValue: 'الجميع',
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        const OrdersTableView()
                      ],
                    ),
                  ),
            SizedBox(
              height: 70.h,
            )
          ],
        ),
      ),
    );
  }

  GestureDetector _buildOrderOption(String text, int index) {
    return GestureDetector(
      onTap: () => _onOrderTap(index),
      child: _buildOrderText(text, index),
    );
  }

  Text _buildOrderCount() {
    return Text(
      '(14)',
      style: AppTextStyle.bodyBold.copyWith(
        color: AppColors.primaryColor.withOpacity(0.3),
      ),
    );
  }
}

class OrderTableItem extends StatelessWidget {
  const OrderTableItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 358,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                DateTime.now().toYMD(),
                style: AppTextStyle.smallBodyBold,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                'رقم الشحنة',
                style: AppTextStyle.caption.copyWith(
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                'اسم الشحنة',
                style: AppTextStyle.caption.copyWith(
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                'تم التوصيل',
                style: AppTextStyle.caption.copyWith(
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
