import 'package:flutter/material.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Features/Authentication/View/sections/choose_type_step.dart';
import 'package:sadiq/Features/Authentication/View/sections/stepper_step.dart';

import '../../../../Core/Paths/image_paths.dart';
import '../../../../Core/Paths/svg_icons_paths.dart';
import '../../../../Core/Shared/ui/buttons/rounded/rounded_button.dart';
import '../../../../Core/Shared/ui/images/app_logo_with_title.dart';
import '../../../../Core/Shared/ui/images/png_display.dart';
import '../../../../Core/Shared/ui/text/custom_text_field.dart';
import '../../../../Core/Theme/Colors/app_colors.dart';
import '../../../../Core/Theme/text/text_style.dart';
import '../cubit/auth_cubit.dart';
import '../sections/choose_city_step.dart';

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
            height: MediaQuery.sizeOf(context).height - 20.h,
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
                            appIconsize: Size(40, 40),
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
                                  : authCubit.signUpStep == 2
                                      ? const StepperStep()
                                      : SizedBox(),
                          /*SizedBox(
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
                          style: AppTextStyle.largeBodyMedium.copyWith(
                              color: AppColors.primaryColor, fontSize: 24),
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
                        */
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
