import 'package:flutter/material.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/Theme/Colors/app_colors.dart';

class SignUpStepper extends StatelessWidget {
  final int activeStep;
  const SignUpStepper({
    super.key,
    required this.activeStep,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.h,
      child: EasyStepper(
        padding: const EdgeInsets.all(0),
        activeStep: activeStep,
        activeStepBackgroundColor: AppColors.primaryColor,
        activeStepTextColor: AppColors.secondaryColor,
        activeStepBorderColor: AppColors.secondaryColor.withOpacity(0.5),
        unreachedStepBackgroundColor:
            const Color.fromARGB(255, 29, 44, 90).withOpacity(0.08),
        unreachedStepTextColor: AppColors.secondaryColor,
        finishedStepTextColor: AppColors.secondaryColor,
        finishedStepBackgroundColor: AppColors.secondaryColor.withOpacity(0.5),
        internalPadding: 0,
        stepRadius: 15,
        showLoadingAnimation: false,
        lineStyle: const LineStyle(
          lineLength: 90,
          defaultLineColor: Colors.grey,
          finishedLineColor: AppColors.secondaryColor,
        ),
        showStepBorder: true,
        defaultStepBorderType: BorderType.normal,
        borderThickness: 1.5,
        enableStepTapping: false,
        steps: [
          EasyStep(
            customStep: Container(
              padding: const EdgeInsets.only(bottom: 5),
              height: 26.17.h,
              width: 26.17.w,
              decoration: BoxDecoration(
                gradient: activeStep >= 1 ? AppColors.appLinearGradient : null,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: activeStep >= 1
                  ? const Icon(Icons.check, color: Colors.white)
                  : const Text(
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
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: activeStep >= 1 ? AppColors.appLinearGradient : null,
              ),
              alignment: Alignment.center,
              child: activeStep > 1
                  ? const Icon(Icons.check, color: Colors.white)
                  : Text(
                      '٢',
                      style: TextStyle(
                        color: activeStep != 1
                            ? AppColors.secondaryColor
                            : Colors.white,
                      ),
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
              ),
              alignment: Alignment.center,
              child: Text(
                '٣',
                style: TextStyle(
                  color:
                      activeStep != 2 ? AppColors.secondaryColor : Colors.white,
                ),
              ),
            ),
            title: 'المستندات',
          ),
        ],
        onStepReached: (index) {},
      ),
    );
  }
}
