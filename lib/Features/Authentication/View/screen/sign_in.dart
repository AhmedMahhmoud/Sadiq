import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/Paths/image_paths.dart';
import 'package:sadiq/Core/Paths/svg_icons_paths.dart';
import 'package:sadiq/Core/Shared/ui/images/app_logo_with_title.dart';
import 'package:sadiq/Core/Shared/ui/images/png_display.dart';
import 'package:sadiq/Core/Shared/ui/images/svg_display.dart';
import 'package:sadiq/Core/Shared/ui/text/custom_text_field.dart';
import 'package:sadiq/Core/Theme/Colors/app_colors.dart';
import 'package:sadiq/Core/Theme/text/text_style.dart';
import 'package:sadiq/Features/Authentication/View/widgets/sign_in_rounded_footer.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundOfWhite,
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height * 0.93,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 15.h),
                        height: 180.h,
                        color: AppColors.backgroundOfWhite,
                        child: const Center(
                          child: SizedBox(
                              child: DisplayAppTitleWithLogo(
                            appIconsize: Size(70, 70),
                            appTitleSize: Size(50, 50),
                          )),
                        ),
                      ),
                      PngDisplay(
                        path: PngAssetsPaths.buildingBG1Padleft,
                        size: Size(320.w, 130.h),
                      ),
                    ],
                  ),
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.only(top: 20.h),
                    color: AppColors.secondaryColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Center(
                            child: Text(
                          'تطبيق المندوب',
                          style: AppTextStyle.largeBodyMedium
                              .copyWith(color: Colors.white, fontSize: 24),
                        )),
                        // ignore: prefer_const_constructors
                        Spacer(),
                        SignInRoundedFooter()
                      ],
                    ),
                  ))
                ],
              ),
              Positioned(
                  top: MediaQuery.sizeOf(context).height / 3.9,
                  child: SvgDisplay(
                    path: SvgAssetsPaths.deliveryBoy,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
