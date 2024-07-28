import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/Paths/svg_icons_paths.dart';
import '../../../../Core/Shared/ui/buttons/rounded/rounded_button.dart';
import '../../../../Core/Shared/ui/text/custom_text_field.dart';
import '../../../../Core/Theme/Colors/app_colors.dart';
import '../../../../Core/Theme/text/text_style.dart';

class StepperStep extends StatelessWidget {
  const StepperStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 35.h,
          child: EasyStepper(
            padding: const EdgeInsets.all(0),
            activeStep: 1,
            activeStepTextColor: AppColors.secondaryColor,
            finishedStepTextColor: Colors.black87,
            internalPadding: 0,
            showLoadingAnimation: false,
            stepRadius: 15,
            lineStyle: const LineStyle(
                lineLength: 90,
                defaultLineColor: Colors.grey,
                finishedLineColor: AppColors.secondaryColor),
            showStepBorder: false,
            steps: [
              EasyStep(
                customStep: Container(
                  padding: const EdgeInsets.only(bottom: 5),
                  height: 26.17.h,
                  width: 26.17.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryColor,
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    '١',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                title: 'البيانات الاساسية',
              ),
              EasyStep(
                customStep: Container(
                  padding: const EdgeInsets.only(bottom: 5),
                  height: 26.17.h,
                  width: 26.17.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryColor,
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    '٢',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                title: 'بيانات المركبة',
              ),
              EasyStep(
                customStep: Container(
                  padding: const EdgeInsets.only(bottom: 5),
                  height: 26.17.h,
                  width: 26.17.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryColor,
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    '٣',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                title: 'المستندات',
              ),
            ],
            onStepReached: (index) {},
          ),
        ),
        Text(
          'البيانات الاساسية',
          style: AppTextStyle.largeBodyMedium
              .copyWith(color: AppColors.primaryColor, fontSize: 24),
        ),
        SizedBox(height: 12.h),
        Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: CustomTextField(
                    hintText: 'الاسم الاول',
                    icon: SvgAssetsPaths.user,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: CustomTextField(
                    hintText: 'اسم العائلة',
                  ),
                ),
              ],
            ),
            SizedBox(height: 6.h),
            CustomTextField(
              hintText: 'رقم الجوال',
              icon: SvgAssetsPaths.phone,
            ),
            SizedBox(height: 6.h),
            CustomTextField(
              hintText: 'البريد الالكتروني',
              icon: SvgAssetsPaths.email,
            ),
            SizedBox(height: 6.h),
            CustomTextField(
              hintText: 'رقم الهوية',
              icon: SvgAssetsPaths.iD,
            ),
            SizedBox(height: 6.h),
            CustomTextField(
              hintText: 'الجنسية',
              icon: SvgAssetsPaths.world,
            ),
            SizedBox(height: 6.h),
            CustomTextField(
              hintText: 'تاريخ الميلاد',
              icon: SvgAssetsPaths.calender,
            ),
          ],
        ),
        Center(
          child: RoundedButton(
            onPressed: () {},
            title: 'التالي',
          ),
        ),
      ],
    );
  }
}
