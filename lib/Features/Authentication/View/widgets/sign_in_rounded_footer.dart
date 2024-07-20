import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/Paths/svg_icons_paths.dart';
import 'package:sadiq/Core/Shared/ui/text/custom_text_field.dart';

class SignInRoundedFooter extends StatelessWidget {
  const SignInRoundedFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r))),
      width: double.infinity,
      height: 330,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              hintText: 'اسم المستخدم / الايميل',
              icon: SvgAssetsPaths.user,
            ),
            const SizedBox(height: 20),
            CustomTextField(hintText: 'كلمة المرور', icon: SvgAssetsPaths.lock),
          ],
        ),
      ),
    );
  }
}
