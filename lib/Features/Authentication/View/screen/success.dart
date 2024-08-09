import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/Paths/image_paths.dart';
import '../../../../Core/Paths/svg_icons_paths.dart';
import '../../../../Core/Shared/ui/buttons/rounded/rounded_button.dart';
import '../../../../Core/Shared/ui/images/app_logo_with_title.dart';
import '../../../../Core/Shared/ui/images/png_display.dart';
import '../../../../Core/Shared/ui/images/svg_display.dart';
import '../../../../Core/Theme/Colors/app_colors.dart';
import '../../../../Core/Theme/text/text_style.dart';
import '../widgets/sign_in_rounded_footer.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundOfWhite,
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: MediaQuery.sizeOf(context).height * 0.16,
              child: PngDisplay(
                path: PngAssetsPaths.city,
                size: Size(390.w, 150.h),
                boxFit: BoxFit.fill,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  color: AppColors.backgroundOfWhite,
                  child: const Center(
                    child: SizedBox(
                      child: DisplayAppTitleWithLogo(
                        appIconsize: Size(50, 50),
                        appTitleSize: Size(35, 35),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  padding:
                      EdgeInsets.symmetric(vertical: 40.h, horizontal: 10.w),
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r),
                    ),
                  ),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.check_circle_rounded,
                        color: Colors.white,
                        size: 55,
                      ),
                      Text(
                        'تم تقديم طلبك بنجاح',
                        style:
                            AppTextStyle.headline.copyWith(color: Colors.white),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        'سوف نقوم بمراجعة الطلب والرد خلال ٤٨ ساعة',
                        style: AppTextStyle.smallBody
                            .copyWith(color: Colors.white),
                      ),
                      SizedBox(height: 25.h),
                      RoundedButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            '/signin',
                            (route) => false,
                          );
                        },
                        title: 'العودة للصفحة الرئيسية',
                        style: TextStyle(
                            color: AppColors.secondaryColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700),
                        btnColor: Colors.white,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              top: MediaQuery.sizeOf(context).height / 2.8,
              child: SvgDisplay(
                path: SvgAssetsPaths.deliveryBoy,
              ),
            )
          ],
        ),
      ),
    );
  }
}
