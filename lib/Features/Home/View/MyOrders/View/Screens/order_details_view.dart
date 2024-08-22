import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/Paths/svg_icons_paths.dart';
import 'package:sadiq/Core/Shared/ui/buttons/rounded/rounded_button.dart';
import 'package:sadiq/Core/Shared/ui/images/svg_display.dart';

import 'package:sadiq/Core/Theme/Colors/app_colors.dart';
import 'package:sadiq/Core/Theme/text/text_style.dart';
import 'package:sadiq/Features/Home/View/MyOrders/View/Widgets/dekivery_location_btn.dart';
import 'package:sadiq/Features/Home/View/MyOrders/View/Widgets/order_price_display.dart';
import 'package:sadiq/Features/Home/View/MyOrders/View/Widgets/payment_way.dart';

class OrderDetailsView extends StatelessWidget {
  final bool isNewOrder;
  const OrderDetailsView({
    required this.isNewOrder,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PriceDisplay(),
              SizedBox(
                height: 10.h,
              ),
              const PaymentWay(),
              SizedBox(
                height: 10.h,
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'وصف الشحنة',
                          style: AppTextStyle.bodyBold,
                        ),
                        Text(
                          'موسبيإ ميرول صن نم خسن ىلع اًضيأ توح يتلاو ركيام جياب سودلأ لثم ينورتكلإلا رشنلا جمارب روهظ عم اَرخؤم ىرخأ ةرم رشتنيل داعو ،صنلا اذه نم عطاقم يوحت ةيكيتسالبلا تيسارتيل قئاقر رادصإ عم نرقلا',
                          style:
                              AppTextStyle.smallBody.copyWith(fontSize: 12.sp),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        if (isNewOrder)
          Positioned(
            bottom: 10.h,
            child: AcceptOrRejectOrder(),
          )
      ],
    );
  }
}

class AcceptOrRejectOrder extends StatelessWidget {
  const AcceptOrRejectOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RoundedButton(
            onPressed: () {
              Navigator.pop(context);
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 20),
                      height: 170,
                      width: 80,
                      child: Column(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          const SvgDisplay(
                              size: Size(38, 38),
                              path: SvgAssetsPaths.completed),
                          SizedBox(
                            width: 170.w,
                            child: Text('لقد قبلت الطلب',
                                textAlign: TextAlign.center,
                                style: AppTextStyle.bodyBold
                                    .copyWith(fontSize: 18.sp)),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Center(
                            child: RoundedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                btnSize: Size(135, 41),
                                style: AppTextStyle.bodyBold.copyWith(
                                    color: Colors.white,
                                    fontSize: 14.sp),
                                title: 'عرض التفاصيل'),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            title: 'قبول',
            iconWidget: const SvgDisplay(
              path: SvgAssetsPaths.completed,
              color: Colors.white,
              size: Size(15, 15),
            ),
            style: AppTextStyle.bodyBold.copyWith(color: Colors.white),
            btnSize: const Size(112, 41)),
        SizedBox(
          width: 15.w,
        ),
        CustomOutlineButton(
            size: const Size(112, 41),
            icon: const Icon(
              Icons.close,
              color: AppColors.primaryColor,
            ),
            onPress: () {
              showCustomDialog(context);
            },
            text: 'رفض')
      ],
    );
  }
}

void showCustomDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          height: 210,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SvgDisplay(path: SvgAssetsPaths.warning),
              SizedBox(
                width: 170.w,
                child: Text('هل أنت متأكد أنك تريد رفض هذا الطلب؟',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.bodyBold.copyWith(fontSize: 18.sp)),
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RoundedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      btnSize: Size(112, 41),
                      style:
                          AppTextStyle.bodyBold.copyWith(color: Colors.white),
                      title: 'نعم'),
                  CustomOutlineButton(
                      size: Size(112, 41),
                      onPress: () {
                        Navigator.of(context).pop();
                      },
                      text: 'لا'),
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}
