import 'package:flutter/material.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/Shared/ui/buttons/rounded/rounded_button.dart';
import 'package:sadiq/Core/Shared/ui/circular_indicator.dart';
import 'package:sadiq/Core/Shared/ui/snackbar/custom_snackbar.dart';
import 'package:sadiq/Core/error/error_retry_widget.dart';
import 'package:sadiq/Features/Authentication/Presentation/sections/choose_type_step.dart';
import 'package:sadiq/Features/Authentication/Presentation/sections/main_details_step.dart';
import 'package:sadiq/Features/Authentication/Presentation/widgets/sign_up_stepper.dart';
import 'package:sadiq/Features/DeliveryCars/View/cubit/carsdelivery_cubit.dart';

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
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
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
                                                  activeStep:
                                                      authCubit.signUpStep - 2,
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
                                    authCubit.changeSignUpStep(
                                        authCubit.signUpStep - 1);
                                  },
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
