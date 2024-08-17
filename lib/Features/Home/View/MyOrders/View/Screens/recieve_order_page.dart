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
import 'package:sadiq/Features/Home/View/MyOrders/View/Widgets/upload_img_dotted_border.dart';
import 'package:sadiq/Features/Home/View/MyOrders/cubit/order_details_stepper_cubit.dart';

class RecieveOrderPage extends StatefulWidget {
  const RecieveOrderPage({super.key});

  @override
  State<RecieveOrderPage> createState() => _RecieveOrderPageState();
}

class _RecieveOrderPageState extends State<RecieveOrderPage> {
  bool isRecieved = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.iconsBackgroundColor.withOpacity(0.3),
      width: MediaQuery.sizeOf(context).width,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'هل هناك ازدحام؟',
              style: AppTextStyle.smallBodyBold
                  .copyWith(color: AppColors.primaryColor),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              width: 250.w,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'إذا كان هناك تأخير في استلام الطلب،',
                      style: AppTextStyle.smallBody.copyWith(fontSize: 12.sp),
                    ),
                    TextSpan(
                      text: 'يرجى الضغط على الزر لإخطار العميل',
                      style:
                          AppTextStyle.smallBodyBold.copyWith(fontSize: 12.sp),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomOutlineButton(
              text: 'اخطار العميل بالتأخير',
              icon: const SvgDisplay(
                  path: SvgAssetsPaths.late, size: Size(20, 20)),
              onPress: () {},
              textColor: AppColors.errorColor,
              size: const Size(358, 50),
              borderColor: AppColors.errorColor,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'ارفاق صورة الفاتورة',
              style: AppTextStyle.smallBodyBold,
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: UploadImageDottedBorder(onImgUploaded: () {
                setState(() {
                  isRecieved = true;
                });
              }),
            ),
            const SizedBox(
              height: 10,
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
                        style: AppTextStyle.smallBody.copyWith(fontSize: 12.sp),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
                child: RoundedButton(
              onPressed: () {
                context.read<OrderDetailsStepperCubit>().changeStep(2);
              },
              title: 'تم الإستلام',
              isEnabled: isRecieved,
              style: AppTextStyle.smallBodyBold.copyWith(color: Colors.white),
              btnSize: const Size(225, 42),
              iconWidget: const SvgDisplay(
                  path: SvgAssetsPaths.completed,
                  color: Colors.white,
                  size: Size(16, 16)),
            ))
          ],
        ),
      ),
    );
  }
}
