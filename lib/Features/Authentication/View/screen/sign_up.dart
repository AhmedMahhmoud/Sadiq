import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Features/Authentication/View/widgets/choose_city_step.dart';

import '../../../../Core/Paths/image_paths.dart';
import '../../../../Core/Shared/ui/images/app_logo_with_title.dart';
import '../../../../Core/Shared/ui/images/png_display.dart';
import '../../../../Core/Theme/Colors/app_colors.dart';

import '../widgets/choose_type_step.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundOfWhite,
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
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
                        appIconsize: Size(40, 40),
                        appTitleSize: Size(30, 30),
                      ),
                    ),
                  ),
                ),
                const ChooseTypeStep(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
