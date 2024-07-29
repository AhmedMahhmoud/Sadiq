import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/Paths/svg_icons_paths.dart';
import '../../../../Core/Shared/ui/buttons/rounded/rounded_button.dart';
import '../../../../Core/Shared/ui/form/custom_text_field.dart';
import '../../../../Core/Theme/Colors/app_colors.dart';
import '../../../../Core/Theme/text/text_style.dart';
import '../cubit/auth_cubit.dart';

class MainDetailsStep extends StatelessWidget {
  const MainDetailsStep({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final authCubit = context.read<AuthCubit>();
        return Column(
          children: [
            Text(
              'البيانات الاساسية',
              style: AppTextStyle.largeBodyMedium
                  .copyWith(color: AppColors.primaryColor, fontSize: 24),
            ),
            SizedBox(height: 12.h),
            Column(
              children: [
                const Row(
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
                const CustomTextField(
                  hintText: 'رقم الجوال',
                  icon: SvgAssetsPaths.phone,
                ),
                SizedBox(height: 6.h),
                const CustomTextField(
                  hintText: 'البريد الالكتروني',
                  icon: SvgAssetsPaths.email,
                ),
                SizedBox(height: 6.h),
                const CustomTextField(
                  hintText: 'رقم الهوية',
                  icon: SvgAssetsPaths.iD,
                ),
                SizedBox(height: 6.h),
                const CustomTextField(
                  hintText: 'الجنسية',
                  icon: SvgAssetsPaths.world,
                ),
                SizedBox(height: 6.h),
                const CustomTextField(
                  hintText: 'تاريخ الميلاد',
                  icon: SvgAssetsPaths.calender,
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
                  authCubit.changeSignUpStep(3);
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
