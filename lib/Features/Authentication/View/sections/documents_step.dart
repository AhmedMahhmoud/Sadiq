import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/Shared/ui/buttons/rounded/rounded_button.dart';
import '../../../../Core/Shared/ui/form/upload_files_btn.dart';
import '../../../../Core/Theme/Colors/app_colors.dart';
import '../../../../Core/Theme/text/text_style.dart';
import '../cubit/auth_cubit.dart';
import '../widgets/login_checkmark.dart';

class DocumentsStep extends StatelessWidget {
  const DocumentsStep({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'ارفاق المستندات',
              style: AppTextStyle.largeBodyMedium
                  .copyWith(color: AppColors.primaryColor, fontSize: 24),
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
            const UploadFileBtn(),
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
            const UploadFileBtn(),
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
            const UploadFileBtn(),
            SizedBox(height: 7.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const LoginCheckmark(),
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
            Center(
              child: RoundedButton(
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/success');
                },
                title: 'إرسال',
              ),
            ),
          ],
        );
      },
    );
  }
}
