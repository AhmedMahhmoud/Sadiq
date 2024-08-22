import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/Paths/svg_icons_paths.dart';
import '../../../../Core/Shared/ui/images/svg_display.dart';
import '../../../../Core/Shared/ui/secondary_app_bar.dart';
import '../../../../Core/Theme/Colors/app_colors.dart';

import '../../../../Core/Theme/text/text_style.dart';
import '../../../Home/View/Widgets/appbar_header.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SecondaryAppHeader(
          bgColor: Colors.white,
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 7.h),
          width: MediaQuery.sizeOf(context).width,
          color: Colors.white,
          child: Center(
            child: Text(
              'إشعارات',
              style: AppTextStyle.headline.copyWith(
                color: AppColors.secondaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 7.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'اشعار جديد',
                style: AppTextStyle.smallBodyHeavyBold.copyWith(
                  color: AppColors.secondaryColor,
                ),
              ),
              const SizedBox(height: 5),
              const NotificationCard(isActive: true),
              const SizedBox(height: 15),
              Text(
                'تم قرائتها',
                style: AppTextStyle.smallBodyHeavyBold.copyWith(
                  color: AppColors.secondaryColor,
                ),
              ),
              const SizedBox(height: 5),
              const NotificationCard(isActive: false),
            ],
          ),
        ),
      ],
    );
  }
}

class NotificationCard extends StatelessWidget {
  final bool isActive;
  const NotificationCard({
    super.key,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.11),
            blurRadius: 13,
            spreadRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
        color:
            isActive ? Colors.white : AppColors.primaryColor.withOpacity(0.12),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Column(
            children: [
              SvgInsideCircle(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.secondaryColor.withOpacity(0.04),
                  border: Border.all(
                    color: AppColors.secondaryColor.withOpacity(0.1),
                  ),
                ),
                path: SvgAssetsPaths.notificationBell,
              ),
            ],
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 290.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'طلب توصيل',
                      style: AppTextStyle.caption.copyWith(
                        color: AppColors.primaryColor,
                        fontSize: 10.sp,
                      ),
                    ),
                    Text(
                      '٥٢٠#',
                      style: AppTextStyle.caption.copyWith(
                        color: AppColors.secondaryColor,
                        fontSize: 10.sp,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'طلب توصيل',
                style: AppTextStyle.subheadline.copyWith(
                  color: AppColors.secondaryColor,
                ),
              ),
              Row(
                children: [
                  Text(
                    'مطعم الرومانسية',
                    style: AppTextStyle.caption.copyWith(
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    ' --------- ',
                    style: AppTextStyle.caption.copyWith(
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                  Text(
                    'حي النخيل',
                    style: AppTextStyle.caption.copyWith(
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              Text(
                '٢٥ مايو ٢٠٢٤ ١١:١٥ ص',
                style: AppTextStyle.caption.copyWith(
                  color: AppColors.primaryColor.withOpacity(0.8),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
