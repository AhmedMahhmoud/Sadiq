import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/Shared/ui/circular_indicator.dart';
import 'package:sadiq/Core/Shared/ui/snackbar/custom_snackbar.dart';
import 'package:sadiq/Core/error/error_retry_widget.dart';
import 'package:sadiq/Features/Lookups/cubit/app_lookups_cubit.dart';

import '../../../../Core/Paths/svg_icons_paths.dart';
import '../../../../Core/Shared/ui/buttons/radio/radio_icon.dart';
import '../../../../Core/Shared/ui/buttons/rounded/rounded_button.dart';
import '../../../../Core/Theme/Colors/app_colors.dart';
import '../../../../Core/Theme/text/text_style.dart';
import '../cubit/auth_cubit.dart';

class ChooseTypeStep extends StatelessWidget {
  const ChooseTypeStep({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      final authCubit = context.read<AuthCubit>();
      return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'اختار',
                style: AppTextStyle.headline.copyWith(
                  color: AppColors.secondaryColor,
                  fontSize: 24.sp,
                ),
              ),
              SizedBox(width: 5.sp),
              Text(
                'نوع التسجيل',
                style: AppTextStyle.headline.copyWith(
                  color: AppColors.primaryColor,
                  fontSize: 24.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RadioIcon(
                icon: SvgAssetsPaths.company,
                title: 'شركة',
                isChooised: authCubit.choosedType == 0 ? true : false,
                onClick: () {
                  authCubit.chooseType(0);
                },
              ),
              SizedBox(width: 10.w),
              RadioIcon(
                icon: SvgAssetsPaths.saudiArabian,
                title: 'سعودي',
                isChooised: authCubit.choosedType == 1 ? true : false,
                onClick: () {
                  authCubit.chooseType(1);
                },
              ),
            ],
          ),
          SizedBox(height: 12.h),
          BlocConsumer<AppLookupsCubit, AppLookupsState>(
            buildWhen: (previous, current) =>
                previous is CompaniesLookupsLoadingState ||
                current is CompaniesLookupsLoadingState,
            listenWhen: (previous, current) =>
                previous is CompaniesLookupsLoadingState ||
                current is CompaniesLookupsLoadingState,
            listener: (context, state) {
              if (state is AppLookupsErrorState) {
                CustomSnackbar.show(context, state.errorMsg, isError: true);
              } else if (state is AppLookupsLoadedState) {
                authCubit.changeSignUpStep(2);
              }
            },
            builder: (context, state) {
              return state is CompaniesLookupsLoadingState
                  ? const CustomCircularIndicator()
                  : state is AppLookupsErrorState
                      ? RetryWidget(retryFunction: () {
                          context
                              .read<AppLookupsCubit>()
                              .getCompaniesFromMixin();
                        })
                      : Opacity(
                          opacity: authCubit.choosedType == -1 ? 0.5 : 1,
                          child: Center(
                            child: RoundedButton(
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                              ),
                              onPressed: () {
                                if (authCubit.choosedType != -1) {
                                  if (authCubit.choosedType == 0) {
                                    context
                                        .read<AppLookupsCubit>()
                                        .getCompaniesFromMixin();
                                  }
                                }
                              },
                              title: 'ابدأ التسجيل',
                            ),
                          ),
                        );
            },
          ),
          SizedBox(height: 5.h),
        ],
      );
    });
  }
}
