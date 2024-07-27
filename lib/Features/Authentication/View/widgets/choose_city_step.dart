import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/Paths/image_paths.dart';
import '../../../../Core/Shared/ui/buttons/rounded/rounded_button.dart';
import '../../../../Core/Shared/ui/images/app_logo_with_title.dart';
import '../../../../Core/Shared/ui/images/png_display.dart';
import '../../../../Core/Shared/ui/text/custom_drompdown.dart';
import '../../../../Core/Theme/Colors/app_colors.dart';
import '../../../../Core/Theme/text/text_style.dart';
import '../cubit/auth_cubit.dart';

class ChooseCityStep extends StatelessWidget {
  const ChooseCityStep({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final authCubit = context.read<AuthCubit>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              height: 120.h,
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
            PngDisplay(
              path: PngAssetsPaths.city,
              size: Size(390.w, 140.h),
              boxFit: BoxFit.cover,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(bottom: 10.h),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.r),
                        topRight: Radius.circular(20.r))),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'تطبيق المندوب',
                              style: AppTextStyle.headline.copyWith(
                                color: AppColors.primaryColor,
                                fontSize: 24.sp,
                              ),
                            ),
                            SizedBox(width: 5.sp),
                            Text(
                              'سجل علي',
                              style: AppTextStyle.headline.copyWith(
                                color: AppColors.secondaryColor,
                                fontSize: 24.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        CustomDropDown(
                          options: const [
                            'Category 1',
                            'Category 2',
                            'Category 3',
                            'Category 4',
                          ],
                          selectedOption: authCubit.choosedCity,
                          onchange: authCubit.chooseCity,
                        ),
                        SizedBox(height: 15.h),
                        Center(
                          child:
                              RoundedButton(onPressed: () {}, title: 'التالي'),
                        ),
                        SizedBox(height: 10.h),
                        Center(
                          child: Text(
                            'هل لديك حساب؟',
                            style: AppTextStyle.smallBody
                                .copyWith(color: AppColors.secondaryColor),
                          ),
                        ),
                        Center(
                          child: Text(
                            'تسجيل الدخول',
                            style: AppTextStyle.smallBodyBold.copyWith(
                                color: AppColors.primaryColor,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
