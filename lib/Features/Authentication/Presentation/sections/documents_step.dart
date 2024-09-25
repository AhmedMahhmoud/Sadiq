import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/Constants/api_constants.dart';
import 'package:sadiq/Core/Shared/ui/buttons/radio/check_mark.dart';
import 'package:sadiq/Core/Shared/ui/circular_indicator.dart';
import 'package:sadiq/Core/Shared/ui/snackbar/custom_snackbar.dart';
import 'package:sadiq/Core/error/error_retry_widget.dart';
import 'package:sadiq/Features/Authentication/Presentation/sections/main_details_step.dart';
import 'package:sadiq/Features/Home/View/MyOrders/cubit/order_details_stepper_cubit.dart';

import '../../../../Core/Shared/ui/buttons/rounded/rounded_button.dart';
import '../../../../Core/Shared/ui/form/upload_files_btn.dart';
import '../../../../Core/Theme/Colors/app_colors.dart';
import '../../../../Core/Theme/text/text_style.dart';
import '../cubit/auth_cubit.dart';
import '../widgets/login_checkmark.dart';

class DocumentsStep extends StatefulWidget {
  const DocumentsStep({super.key});

  @override
  State<DocumentsStep> createState() => _DocumentsStepState();
}

class _DocumentsStepState extends State<DocumentsStep> {
  bool acceptTermsVal = false;
  validateDocument() {
    final AuthCubit authCubit = context.read<AuthCubit>();
    final builderModel = authCubit.registerInputsBuilder;
    if (acceptTermsVal &&
        builderModel.formFile != null &&
        builderModel.drivingLicenseFile != null &&
        builderModel.identityFile != null) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'ارفاق المستندات',
              style: AppTextStyle.largeBodyMedium.copyWith(
                  color: AppColors.primaryColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12.h),
            Text(
              'الهوية',
              style: AppTextStyle.smallBodyBold.copyWith(
                color: AppColors.secondaryColor,
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
              ),
            ),
            SizedBox(height: 7.h),
            UploadFileBtn(
              onFilePicked: (filePicked) {
                authCubit.registerInputsBuilder.identityFile = filePicked;
                setState(() {});
              },
            ),
            SizedBox(height: 12.h),
            Text(
              'الاستمارة',
              style: AppTextStyle.smallBodyBold.copyWith(
                color: AppColors.secondaryColor,
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
              ),
            ),
            SizedBox(height: 7.h),
            UploadFileBtn(
              onFilePicked: (filePicked) {
                authCubit.registerInputsBuilder.formFile = filePicked;
                setState(() {});
              },
            ),
            SizedBox(height: 12.h),
            Text(
              'رخصة القيادة',
              style: AppTextStyle.smallBodyBold.copyWith(
                color: AppColors.secondaryColor,
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
              ),
            ),
            SizedBox(height: 7.h),
            UploadFileBtn(
              onFilePicked: (filePicked) {
                authCubit.registerInputsBuilder.drivingLicenseFile = filePicked;
                setState(() {});
              },
            ),
            SizedBox(height: 7.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomCheckMark(
                  enabled: acceptTermsVal,
                  onChanged: () {
                    setState(() {
                      acceptTermsVal = !acceptTermsVal;
                    });
                  },
                ),
                SizedBox(width: 5.w),
                Text(
                  'أوافق علي ',
                  style: AppTextStyle.smallBody.copyWith(
                    color: AppColors.secondaryColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'الشروط والاحكام',
                  style: AppTextStyle.smallBody.copyWith(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
            SizedBox(height: 18.h),
            BlocConsumer<AuthCubit, AuthState>(
              buildWhen: (previous, current) =>
                  previous is AuthRegisterLoadingState ||
                  current is AuthRegisterLoadingState,
              listener: (context, state) {
                if (state is AuthRegisterSuccessState) {
                  //reset stepper val
                  context.read<OrderDetailsStepperCubit>().changeStep(0);
                  Navigator.pushReplacementNamed(context, '/success');
                } else if (state is AuthRegisterErrorState) {
                  CustomSnackbar.show(context, state.errorMsg, isError: true);
                }
              },
              builder: (context, state) {
                return Center(
                  child: state is AuthRegisterLoadingState
                      ? const CustomCircularIndicator()
                      : state is AuthRegisterErrorState
                          ? RetryWidget(retryFunction: () {
                              authCubit.signUp();
                            })
                          : Opacity(
                              opacity: validateDocument() ? 1 : 0.5,
                              child: RoundedButton(
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                                onPressed: () {
                                  if (validateDocument()) {
                                    authCubit.signUp();
                                  }
                                },
                                title: 'إرسال',
                              ),
                            ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
