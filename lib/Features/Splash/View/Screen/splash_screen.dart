import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sadiq/Core/Paths/image_paths.dart';
import 'package:sadiq/Core/Paths/svg_icons_paths.dart';
import 'package:sadiq/Core/Shared/ui/images/app_logo_with_title.dart';
import 'package:sadiq/Core/Shared/ui/images/png_display.dart';
import 'package:sadiq/Core/Shared/ui/images/svg_display.dart';
import 'package:sadiq/Core/Theme/Colors/app_colors.dart';
import 'package:sadiq/Core/Theme/text/text_style.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundOfWhite,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(children: [
            SizedBox(
              height: 60.h,
            ),
            const DisplayAppTitleWithLogo(),
            SizedBox(
              height: 20.h,
            ),
            Text('مرحبا بك في',
                style: AppTextStyle.title3
                    .copyWith(color: AppColors.secondaryColor)),
            Text(
              "تطبيق المندوب",
              style:
                  AppTextStyle.title3.copyWith(color: AppColors.primaryColor),
            ),
          ]),
          PngDisplay(
            path: PngAssetsPaths.imgPath,
            size: Size(MediaQuery.sizeOf(context).width, 300),
          )
        ],
      ),
    );
  }
}
