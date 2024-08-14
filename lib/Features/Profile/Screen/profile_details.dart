import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/Paths/svg_icons_paths.dart';
import '../../../Core/Shared/ui/buttons/back_btn.dart';
import '../../../Core/Shared/ui/buttons/rounded/rounded_button.dart';
import '../../../Core/Shared/ui/form/custom_text_field.dart';
import '../../../Core/Shared/ui/images/svg_display.dart';
import '../../../Core/Theme/Colors/app_colors.dart';
import '../../../Core/Theme/text/text_style.dart';

class ProfileDetailsScreen extends StatelessWidget {
  const ProfileDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height - 20.h,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 23.h, horizontal: 70.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SvgDisplay(
                    path: SvgAssetsPaths.profile,
                    size: Size(116, 116),
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SvgDisplay(
                        path: SvgAssetsPaths.camera,
                        size: Size(16, 16),
                      ),
                      Text(
                        ' حمل الصورة',
                        style: AppTextStyle.caption
                            .copyWith(color: AppColors.primaryColor),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  CustomTextField(
                    hintText: '',
                    icon: SvgAssetsPaths.user,
                    height: 41,
                    iconColor: AppColors.secondaryColor.withOpacity(0.5),
                    bGColor: AppColors.primaryColor.withOpacity(0.04),
                  ),
                  SizedBox(height: 6.h),
                  CustomTextField(
                    hintText: '',
                    icon: SvgAssetsPaths.phone,
                    height: 41,
                    iconColor: AppColors.secondaryColor.withOpacity(0.5),
                    bGColor: AppColors.primaryColor.withOpacity(0.04),
                  ),
                  SizedBox(height: 6.h),
                  CustomTextField(
                    hintText: '',
                    icon: SvgAssetsPaths.email,
                    height: 41,
                    iconColor: AppColors.secondaryColor.withOpacity(0.5),
                    bGColor: AppColors.primaryColor.withOpacity(0.04),
                  ),
                  SizedBox(height: 6.h),
                  CustomTextField(
                    hintText: '',
                    icon: SvgAssetsPaths.calender,
                    height: 41,
                    iconColor: AppColors.secondaryColor.withOpacity(0.5),
                    bGColor: AppColors.primaryColor.withOpacity(0.04),
                  ),
                  SizedBox(height: 20.h),
                  RoundedButton(
                    title: 'حفظ',
                    onPressed: () {},
                    width: 112,
                    height: 41,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                    iconWidget: const Icon(
                      Icons.check_circle_rounded,
                      color: Colors.white,
                      size: 16,
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.sizeOf(context).height * 0.03,
              left: 10.w,
              child: const BackBtn(
                height: 35,
                iconSize: 22,
                width: 35,
              ),
            )
          ],
        ),
      ),
    );
  }
}
