import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/Paths/svg_icons_paths.dart';
import '../../../../Core/Shared/ui/buttons/radio/radio_icon.dart';
import '../../../../Core/Shared/ui/buttons/rounded/rounded_button.dart';
import '../../../../Core/Theme/Colors/app_colors.dart';
import '../../../../Core/Theme/text/text_style.dart';
import '../cubit/auth_cubit.dart';

class VehicleDetailsStep extends StatelessWidget {
  const VehicleDetailsStep({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final authCubit = context.read<AuthCubit>();
        return Column(
          children: [
            Text(
              'بيانات المركبة',
              style: AppTextStyle.largeBodyMedium
                  .copyWith(color: AppColors.primaryColor, fontSize: 24),
            ),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RadioIcon(
                  icon: SvgAssetsPaths.normalCar,
                  title: 'سيارة عادية',
                  isChooised: authCubit.choosedVehcile == 0 ? true : false,
                  size: const Size(50, 43),
                  onClick: () {
                    authCubit.chooseVehcile(0);
                  },
                ),
                SizedBox(width: 10.w),
                RadioIcon(
                  icon: SvgAssetsPaths.normalMoto,
                  title: 'دباب عادي',
                  isChooised: authCubit.choosedVehcile == 1 ? true : false,
                  size: const Size(59, 53),
                  onClick: () {
                    authCubit.chooseVehcile(1);
                  },
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RadioIcon(
                  icon: SvgAssetsPaths.electricCar,
                  title: 'سيارة فيجو',
                  isChooised: authCubit.choosedVehcile == 2 ? true : false,
                  size: const Size(59, 53),
                  onClick: () {
                    authCubit.chooseVehcile(2);
                  },
                ),
                SizedBox(width: 10.w),
                RadioIcon(
                  icon: SvgAssetsPaths.electricMoto,
                  size: const Size(59, 53),
                  title: 'دباب فيجو',
                  isChooised: authCubit.choosedVehcile == 3 ? true : false,
                  onClick: () {
                    authCubit.chooseVehcile(3);
                  },
                ),
              ],
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
                  authCubit.changeSignUpStep(4);
                },
                title: 'استمر',
              ),
            ),
          ],
        );
      },
    );
  }
}
