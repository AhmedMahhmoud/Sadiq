import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/Shared/ui/secondary_app_bar.dart';

import '../../../../Core/Paths/svg_icons_paths.dart';
import '../../../../Core/Shared/ui/images/svg_display.dart';
import '../../../../Core/Theme/Colors/app_colors.dart';
import '../../../../Core/Theme/text/text_style.dart';
import '../../../../Routes/route_naviation_service.dart';
import '../../../Earnings/screen/earnings.dart';
import '../../../Setting/View/Screen/setting.dart';
import '../Widgets/contact_details_card.dart';
import '../Widgets/profile_card.dart';
import '../Widgets/profile_tile.dart';
import '../../../Policy/screen/policy.dart';
import '../cubit/profile_cubit.dart';
import 'profile_details.dart';
import 'subscription.dart';
import '../../../TermsAndCondictions/screen/terms_conditions.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    late ProfileCubit profileCubit;
    return Padding(
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
              InkWell(
                onTap: () {
                  RouteNavService.navigateToPage(
                      const ProfileDetailsScreen(), context);
                },
                child: Row(
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
                ),
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
              SizedBox(width: 5.w),
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
              InkWell(
                onTap: () {
                  RouteNavService.navigateToPage(
                      const SubscriptionScreen(), context);
                },
                child: ProfileCard(
                  title: Text(
                    'الاشتراك',
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
              ),
              InkWell(
                onTap: () {
                  RouteNavService.navigateToPage(
                      const EarningsScreen(), context);
                },
                child: ProfileCard(
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
              ),
            ],
          ),
          SizedBox(height: 5.h),
          ProfileTile(
            title: 'شحن البطارية',
            icon: SvgAssetsPaths.chargingBattery,
            iconSize: const Size(27, 27),
            onClick: () {},
          ),
          ProfileTile(
            title: 'البطاقات المحفوظة',
            icon: SvgAssetsPaths.creditCard,
            iconSize: const Size(25, 17),
            onClick: () {},
          ),
          ProfileTile(
            title: 'الإعدادات',
            icon: SvgAssetsPaths.setting,
            iconSize: const Size(22, 22),
            onClick: () {
              RouteNavService.navigateToPage(const SettingScreen(), context);
            },
          ),
          ProfileTile(
            title: 'الشروط و الأحكام',
            icon: SvgAssetsPaths.termsConditions,
            iconSize: const Size(22, 22),
            onClick: () {
              RouteNavService.navigateToPage(
                  const TermsConditionsScreen(), context);
            },
          ),
          ProfileTile(
            title: 'سياسة الخصوصية',
            icon: SvgAssetsPaths.privacyPolicy,
            iconSize: const Size(20, 23),
            withUnderLine: false,
            onClick: () {
              RouteNavService.navigateToPage(const PolicyScreen(), context);
            },
          ),
          SizedBox(height: 10.h),
          BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              return InkWell(
                onTap: () {
                  context.read<ProfileCubit>().logout();
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/signin',
                    (route) => false,
                  );
                },
                child: Container(
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
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
