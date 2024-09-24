import 'package:flutter/material.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Features/Authentication/Presentation/sections/choose_type_step.dart';
import 'package:sadiq/Features/Authentication/Presentation/sections/main_details_step.dart';

import '../../../../Core/Paths/image_paths.dart';
import '../../../../Core/Shared/ui/buttons/back_btn.dart';
import '../../../../Core/Shared/ui/images/app_logo_with_title.dart';
import '../../../../Core/Shared/ui/images/png_display.dart';
import '../../../../Core/Theme/Colors/app_colors.dart';
import '../cubit/auth_cubit.dart';
import '../sections/choose_city_step.dart';
import '../sections/documents_step.dart';
import '../sections/vehicle_details.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      final authCubit = context.read<AuthCubit>();
      return Scaffold(
        backgroundColor: AppColors.backgroundOfWhite,
        body: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height - 20,
            child: Stack(
              children: [
                Positioned(
                  top: MediaQuery.sizeOf(context).height * 0.2,
                  child: PngDisplay(
                    path: PngAssetsPaths.city,
                    size: Size(390.w, 160.h),
                    boxFit: BoxFit.cover,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      color: AppColors.backgroundOfWhite,
                      child: const Center(
                        child: SizedBox(
                          child: DisplayAppTitleWithLogo(
                            appIconsize: Size(47, 47),
                            appTitleSize: Size(30, 30),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 12.h,
                        horizontal: 12.w,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.r),
                          topRight: Radius.circular(20.r),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          authCubit.signUpStep == 0
                              ? const ChooseCityStep()
                              : authCubit.signUpStep == 1
                                  ? const ChooseTypeStep()
                                  : Column(
                                      children: [
                                        SignUpStepper(
                                          activeStep: authCubit.signUpStep - 2,
                                        ),
                                        authCubit.signUpStep == 2
                                            ? const MainDetailsStep()
                                            : authCubit.signUpStep == 3
                                                ? const VehicleDetailsStep()
                                                : const DocumentsStep(),
                                      ],
                                    )
                        ],
                      ),
                    ),
                  ],
                ),
                authCubit.signUpStep > 0
                    ? Positioned(
                        top: MediaQuery.sizeOf(context).height * 0.001,
                        left: 10.w,
                        child: BackBtn(
                          height: 39.59,
                          width: 39.59,
                          onClick: () {
                            authCubit
                                .changeSignUpStep(authCubit.signUpStep - 1);
                          },
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      );
    });
  }
}

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
