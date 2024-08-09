import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/Paths/svg_icons_paths.dart';
import 'package:wheel_picker/wheel_picker.dart';
import '../../../../Core/Paths/image_paths.dart';
import '../../../../Core/Shared/ui/buttons/rounded/rounded_button.dart';
import '../../../../Core/Shared/ui/images/app_logo_with_title.dart';

import '../../../../Core/Shared/ui/images/svg_display.dart';
import '../../../../Core/Theme/Colors/app_colors.dart';
import '../../../../Core/Theme/text/text_style.dart';
import '../../../Authentication/View/widgets/login_checkmark.dart';
import '../cubit/setting_cubit.dart';
import '../widgets/setting_card.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingCubit, SettingState>(
      builder: (context, state) {
        final settingCubit = context.read<SettingCubit>();
        return Scaffold(
          backgroundColor: const Color(0xfff2f5ff),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: const Color(0xfff2f5ff),
                  child: const Center(
                    child: SizedBox(
                      child: DisplayAppTitleWithLogo(
                        appIconsize: Size(50, 50),
                        appTitleSize: Size(35, 35),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'قوم بضبط الإعدادات التالية',
                      style: AppTextStyle.headline.copyWith(
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 35.h),
                    SettingCard(
                      title: 'جاهز للعمل',
                      isSVG: false,
                      icon: PngAssetsPaths.available,
                      widget: SizedBox(
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Switch(
                            activeColor: AppColors.primaryColor,
                            value: settingCubit.isReady,
                            onChanged: (value) {
                              settingCubit.changeReadyStatus();
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    SettingCard(
                      title: 'تفعيل اعدادات الخرائط',
                      isSVG: true,
                      icon: SvgAssetsPaths.location,
                      widget: SizedBox(
                        child: Switch(
                          activeColor: AppColors.primaryColor,
                          value: settingCubit.openLocation,
                          onChanged: (value) {
                            settingCubit.changeLocationStatus();
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    SettingCard(
                      title: 'نوع حقيبة التوصيل',
                      isSVG: true,
                      icon: SvgAssetsPaths.delivery,
                      widget: Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: InkWell(
                          onTap: () {
                            bottomSheet(context);
                          },
                          child: Text(
                            'نوع الحقيبة هنا...',
                            style: AppTextStyle.caption.copyWith(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    SettingCard(
                      title: 'درجة حرارة الجسم',
                      isSVG: true,
                      icon: SvgAssetsPaths.temperature,
                      widget: Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: InkWell(
                          onTap: () {},
                          child: Text(
                            '36.5',
                            style: AppTextStyle.caption.copyWith(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
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
                          'سياسة الخصوصية',
                          style: AppTextStyle.smallBody.copyWith(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                RoundedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/home', (route) => false);
                  },
                  title: 'إبدأ العمل',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  bottomSheet(BuildContext context) {
    return showModalBottomSheet(
      barrierColor: AppColors.secondaryColor.withOpacity(0.4),
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          height: 200.h,
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 7.h),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        child: const Icon(
                          Icons.close,
                          color: AppColors.secondaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SvgInsideCircle(
                path: SvgAssetsPaths.delivery,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      const Color.fromARGB(255, 29, 44, 90).withOpacity(0.04),
                  border: Border.all(
                    color:
                        const Color.fromARGB(255, 29, 44, 90).withOpacity(0.1),
                  ),
                ),
              ),
              Text(
                'نوع حقيبة التوصيل',
                style: AppTextStyle.headline.copyWith(
                  color: AppColors.secondaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                width: 300,
                child: WheelPickerExample(),
              ),
              RoundedButton(
                onPressed: () {},
                title: 'حفظ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
                width: 100,
                height: 35,
              ),
            ],
          ),
        );
      },
    );
  }
}

class WheelPickerExample extends StatelessWidget {
  const WheelPickerExample({super.key});

  @override
  Widget build(BuildContext context) {
    final secondsWheel = WheelPickerController(itemCount: 10);
    TextStyle textStyle =
        TextStyle(fontSize: 10.sp, height: 1.5, fontWeight: FontWeight.w800);

    return WheelPicker(
      builder: (context, index) => Text("نوع الحقيبة هنا...", style: textStyle),
      controller: secondsWheel,
      selectedIndexColor: AppColors.primaryColor,
      onIndexChanged: (index) {
        print("On index $index");
      },
      style: const WheelPickerStyle(
        size: 150,
        itemExtent: 23,
        squeeze: 1.25,
        diameterRatio: .8,
        surroundingOpacity: .25,
        magnification: 1.2,
      ),
    );
  }
}
