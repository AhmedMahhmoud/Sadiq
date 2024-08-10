import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/Paths/svg_icons_paths.dart';
import '../../../Core/Shared/ui/images/svg_display.dart';
import '../../../Core/Theme/Colors/app_colors.dart';
import '../../../Core/Theme/text/text_style.dart';
import '../../Home/View/Widgets/appbar_header.dart';
import '../Widgets/contact_details_card.dart';
import '../Widgets/profile_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarHeader(
        backGC: AppColors.backgroundSecondaryColor,
      ),
      backgroundColor: AppColors.backgroundSecondaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const SvgDisplay(
                      path: SvgAssetsPaths.profile,
                      size: Size(36, 36),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'عبد الله احمد',
                      style: AppTextStyle.subheadline
                          .copyWith(color: AppColors.secondaryColor),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const SvgDisplay(
                      path: SvgAssetsPaths.edit,
                      size: Size(15, 15),
                      color: AppColors.primaryColor,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'تعديل',
                      style: AppTextStyle.caption
                          .copyWith(color: AppColors.primaryColor),
                    ),
                  ],
                )
              ],
            ),
            const Divider(
              color: Colors.grey,
              height: 12,
              thickness: 0.5,
            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const ContactDetailsCard(
                  icon: Icons.phone,
                  title: '٩٢٠٠١٥١٣٠',
                ),
                SizedBox(
                  width: 5.w,
                ),
                const ContactDetailsCard(
                  icon: Icons.email_rounded,
                  title: 'name@gmail.com',
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ProfileCard(
                  title: Text(
                    'المحفظة',
                    style: AppTextStyle.caption
                        .copyWith(color: Colors.white, fontSize: 10.sp),
                  ),
                  bgColor: AppColors.secondaryColor,
                  icon: Icons.add_outlined,
                  svgPath: SvgAssetsPaths.wallet,
                  money: '٤٠٠',
                ),
                ProfileCard(
                  title: Text(
                    'المحفظة',
                    style: AppTextStyle.caption
                        .copyWith(color: Colors.white, fontSize: 10.sp),
                  ),
                  bgColor: AppColors.primaryColor,
                  icon: Icons.recycling,
                  svgPath: SvgAssetsPaths.calender,
                  money: '٤٠٠',
                  subTitle: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 4.h),
                        child: Text(
                          'أنت على الخطة \n الشهرية',
                          style: AppTextStyle.bodyMedium
                              .copyWith(color: Colors.white, fontSize: 10.sp),
                        ),
                      ),
                    ],
                  ),
                ),
                ProfileCard(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'الأرباح',
                        style: AppTextStyle.caption.copyWith(
                            color: AppColors.primaryColor, fontSize: 10.sp),
                      ),
                      Text(
                        'الاجمالي',
                        style: AppTextStyle.caption.copyWith(
                            color: AppColors.secondaryColor, fontSize: 10.sp),
                      ),
                    ],
                  ),
                  bgColor: Colors.white,
                  icon: Icons.arrow_forward_ios_rounded,
                  gradient: AppColors.appLinearGradient,
                  svgPath: SvgAssetsPaths.earnings,
                  money: '١،٥٠٠',
                ),
              ],
            ),
            SizedBox(height: 5.h),
            const ProfileTile(
              title: 'شحن البطارية',
              icon: SvgAssetsPaths.chargingBattery,
              iconSize: Size(27, 27),
            ),
            const ProfileTile(
              title: 'البطاقات المحفوظة',
              icon: SvgAssetsPaths.creditCard,
              iconSize: Size(25, 17),
            ),
            const ProfileTile(
              title: 'الإعدادات',
              icon: SvgAssetsPaths.setting,
              iconSize: Size(22, 22),
            ),
            const ProfileTile(
              title: 'الشروط و الأحكام',
              icon: SvgAssetsPaths.termsConditions,
              iconSize: Size(22, 22),
            ),
            const ProfileTile(
              title: 'سياسة الخصوصية',
              icon: SvgAssetsPaths.privacyPolicy,
              iconSize: Size(20, 23),
              withUnderLine: false,
            ),
            SizedBox(height: 10.h),
            Container(
              width: 191.w,
              height: 24.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: AppColors.backgroundSecondaryColor,
                border: Border.all(color: AppColors.primaryColor),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SvgDisplay(
                    path: SvgAssetsPaths.logout,
                    size: Size(15, 15),
                    color: AppColors.primaryColor,
                  ),
                  SizedBox(width: 5.w),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      'تسجيل خروج',
                      style: AppTextStyle.smallBodyBold.copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  final String title;
  final String icon;
  final Size iconSize;
  final bool withUnderLine;
  const ProfileTile({
    super.key,
    required this.title,
    required this.icon,
    required this.iconSize,
    this.withUnderLine = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgDisplay(
              path: icon,
              size: iconSize,
            ),
            SizedBox(width: 7.w),
            Text(
              title,
              style: AppTextStyle.smallBodyBold.copyWith(
                  color: AppColors.secondaryColor, fontWeight: FontWeight.w400),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColors.secondaryColor,
              size: 18,
            )
          ],
        ),
        const SizedBox(height: 5),
        withUnderLine
            ? const Divider(
                color: Colors.grey,
                height: 12,
                thickness: 0.5,
              )
            : const SizedBox(),
        SizedBox(height: withUnderLine ? 5.h : 0),
      ],
    );
  }
}
