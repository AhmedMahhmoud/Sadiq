import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/Theme/Colors/app_colors.dart';
import 'package:sadiq/Core/Theme/text/text_style.dart';
import 'package:sadiq/Features/Home/View/MyOrders/cubit/order_details_stepper_cubit.dart';

class DeliveryStepper extends StatelessWidget {
  final int activeStep;
  const DeliveryStepper({
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
        unreachedStepBackgroundColor: AppColors.primaryColor.withOpacity(0.05),
        unreachedStepTextColor: AppColors.secondaryColor,
        finishedStepTextColor: AppColors.secondaryColor,
        finishedStepBackgroundColor: AppColors.secondaryColor.withOpacity(0.5),
        internalPadding: 0,
        stepRadius: 15,
        showLoadingAnimation: false,
        lineStyle: LineStyle(
          lineLength: 70.w,
          defaultLineColor: Colors.grey,
          finishedLineColor: AppColors.secondaryColor,
        ),
        showStepBorder: true,
        defaultStepBorderType: BorderType.normal,
        borderThickness: 1.5,
        enableStepTapping: false,
        steps: List.generate(4, (index) {
          return EasyStep(
            customStep: _buildCustomStep(index, context),
            customTitle: _buildStepTitle(index),
          );
        }),
        onStepReached: (index) {
          print('Step $index reached');
        },
      ),
    );
  }

  Widget _buildCustomStep(int index, BuildContext context) {
    final stepNumber = (index + 1).toString();
    return InkWell(
      onTap: () {
        context.read<OrderDetailsStepperCubit>().changeStep(index);
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 5),
        height: 26.17.h,
        width: 26.17.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: activeStep > index ? AppColors.appLinearGradient : null,
        ),
        alignment: Alignment.center,
        child: activeStep > index
            ? const Icon(Icons.check, color: Colors.white)
            : Text(
                stepNumber,
                style: TextStyle(
                  color: activeStep == index
                      ? Colors.white
                      : AppColors.secondaryColor,
                ),
              ),
      ),
    );
  }

  Widget _buildStepTitle(int index) {
    const stepTitles = [
      'مكان التسليم',
      'استلام الطلب',
      'مكان الأستلام',
      'تسليم الطلب',
    ];

    bool isReached = activeStep >= index;

    return Text(
      stepTitles[index],
      style: isReached
          ? AppTextStyle.smallBodyBold
          : AppTextStyle.body
              .copyWith(color: AppColors.secondaryColor.withOpacity(0.5)),
      textAlign: TextAlign.center,
    );
  }
}
