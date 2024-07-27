import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/Paths/svg_icons_paths.dart';
import '../../../../Core/Shared/ui/buttons/rounded/rounded_button.dart';
import '../../../../Core/Shared/ui/images/svg_display.dart';
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
      return Container(
        padding: EdgeInsets.only(bottom: 10.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
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
                      'نوع التسجيل',
                      style: AppTextStyle.headline.copyWith(
                        color: AppColors.primaryColor,
                        fontSize: 24.sp,
                      ),
                    ),
                    SizedBox(width: 5.sp),
                    Text(
                      'اختار',
                      style: AppTextStyle.headline.copyWith(
                        color: AppColors.secondaryColor,
                        fontSize: 24.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SignUpTypeBtn(
                      icon: SvgAssetsPaths.saudiArabian,
                      title: 'سعودي',
                      isChooised: authCubit.choosedType == 0 ? true : false,
                      onClick: () {
                        authCubit.chooseType(0);
                      },
                    ),
                    SizedBox(width: 10.w),
                    SignUpTypeBtn(
                      icon: SvgAssetsPaths.company,
                      title: 'شركة',
                      isChooised: authCubit.choosedType == 1 ? true : false,
                      onClick: () {
                        authCubit.chooseType(1);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 15.h),
                Center(
                  child: RoundedButton(onPressed: () {}, title: 'ابدأ التسجيل'),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class SignUpTypeBtn extends StatelessWidget {
  final String icon;
  final String title;
  final bool isChooised;
  final VoidCallback onClick;
  const SignUpTypeBtn({
    super.key,
    required this.icon,
    required this.title,
    required this.isChooised,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        padding: EdgeInsets.only(bottom: 10.h, top: 3.h),
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(isChooised ? 0.15 : 0.08),
          borderRadius: BorderRadius.circular(
            10,
          ),
          border: Border.all(
            color: AppColors.primaryColor.withOpacity(0.16),
          ),
        ),
        width: 171,
        height: 168,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            isChooised
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            width: 1,
                            color: AppColors.secondaryColor,
                          ),
                        ),
                        child: const Icon(
                          Icons.circle,
                          size: 16,
                          color: AppColors.secondaryColor,
                        ),
                      ),
                    ],
                  )
                : const SizedBox(),
            const Spacer(),
            SvgDisplay(
              path: icon,
              size: const Size(99, 93),
            ),
            Divider(
              color: AppColors.primaryColor.withOpacity(0.08),
              height: 0,
              indent: 0,
              thickness: 1,
            ),
            Text(
              title,
              style: AppTextStyle.smallBody.copyWith(
                color: isChooised
                    ? AppColors.secondaryColor
                    : AppColors.primaryColor,
                fontWeight: isChooised ? FontWeight.w900 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
