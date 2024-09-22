import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/CommonData/Models/city_model.dart';
import 'package:sadiq/Core/Shared/ui/snackbar/custom_snackbar.dart';
import 'package:sadiq/Features/Lookups/cubit/app_lookups_cubit.dart';

import '../../../../Core/Shared/ui/buttons/rounded/rounded_button.dart';
import '../../../../Core/Shared/ui/form/custom_drompdown.dart';
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
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'سجل علي',
                  style: AppTextStyle.headline.copyWith(
                    color: AppColors.secondaryColor,
                    fontSize: 24.sp,
                  ),
                ),
                SizedBox(width: 5.sp),
                Text(
                  'تطبيق المندوب',
                  style: AppTextStyle.headline.copyWith(
                    color: AppColors.primaryColor,
                    fontSize: 24.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            BlocConsumer<AppLookupsCubit, AppLookupsState>(
              buildWhen: (previous, current) =>
                  previous is CitiesLookupsLoadingState ||
                  current is CitiesLookupsLoadingState,
              listenWhen: (previous, current) =>
                  previous is CitiesLookupsLoadingState ||
                  current is CitiesLookupsLoadingState,
              listener: (context, state) {
                if (state is AppLookupsErrorState) {
                  CustomSnackbar.show(context, state.errorMsg, isError: true);
                }
              },
              builder: (context, state) {
                final lookupsCubit = context.read<AppLookupsCubit>();
                return state is CitiesLookupsLoadingState
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      )
                    : CustomDropDown<CityModel>(
                        options: lookupsCubit.cities,
                        selectedOption: authCubit.choosedCity,
                        onchange: (p0) {
                          authCubit.chooseCity(p0!);
                        },
                        hintText: 'اختر المدينة',
                        itemToString: (city) => city.name,
                      );
              },
            ),
            SizedBox(height: 12.h),
            Center(
              child: RoundedButton(
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
                onPressed: () {
                  authCubit.changeSignUpStep(1);
                },
                title: 'التالي',
              ),
            ),
            Column(
              children: [
                SizedBox(height: 25.h),
                Center(
                  child: Text(
                    'هل لديك حساب؟',
                    style: AppTextStyle.smallBody
                        .copyWith(color: AppColors.secondaryColor),
                  ),
                ),
                InkWell(
                  onTap: () =>
                      Navigator.pushReplacementNamed(context, '/signin'),
                  child: Center(
                    child: Text(
                      'تسجيل الدخول',
                      style: AppTextStyle.smallBodyBold.copyWith(
                          color: AppColors.primaryColor,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
