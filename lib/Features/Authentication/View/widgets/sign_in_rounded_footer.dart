import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/Paths/svg_icons_paths.dart';
import 'package:sadiq/Core/Shared/ui/buttons/rounded/rounded_button.dart';
import 'package:sadiq/Core/Shared/ui/text/custom_text_field.dart';
import 'package:sadiq/Core/Theme/Colors/app_colors.dart';
import 'package:sadiq/Core/Theme/text/text_style.dart';
import 'package:sadiq/Features/Authentication/View/widgets/login_checkmark.dart';

class SignInRoundedFooter extends StatelessWidget {
  const SignInRoundedFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 35.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r))),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomTextField(
                hintText: 'اسم المستخدم / الايميل',
                icon: SvgAssetsPaths.user,
              ),
              SizedBox(height: 6.h),
              CustomTextField(
                  hintText: 'كلمة المرور', icon: SvgAssetsPaths.lock),
              SizedBox(height: 6.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'هل نسيت كلمة المرور؟',
                    style: AppTextStyle.smallBody.copyWith(
                        color: AppColors.secondaryColor,
                        decoration: TextDecoration.underline),
                  ),
                  SizedBox(
                    height: 25.h,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'تذكرني',
                          style: AppTextStyle.smallBody
                              .copyWith(color: AppColors.secondaryColor),
                        ),
                        SizedBox(width: 5.w),
                        const LoginCheckmark(),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Center(
                  child:
                      RoundedButton(onPressed: () {}, title: 'تسجيل الدخول')),
              const SizedBox(
                height: 5,
              ),
              Center(
                child: Text(
                  'ليس لديك حساب؟',
                  style: AppTextStyle.smallBody
                      .copyWith(color: AppColors.secondaryColor),
                ),
              ),
              Center(
                child: Text(
                  'اطلب انشاء حساب',
                  style: AppTextStyle.smallBodyBold.copyWith(
                      color: AppColors.primaryColor,
                      decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
