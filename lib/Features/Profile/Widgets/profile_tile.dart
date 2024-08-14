import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/Shared/ui/images/svg_display.dart';
import '../../../Core/Theme/Colors/app_colors.dart';
import '../../../Core/Theme/text/text_style.dart';

class ProfileTile extends StatelessWidget {
  final String title;
  final String icon;
  final Size iconSize;
  final bool withUnderLine;
  final VoidCallback onClick;
  const ProfileTile({
    super.key,
    required this.title,
    required this.icon,
    required this.iconSize,
    this.withUnderLine = true,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            onClick();
          },
          child: Row(
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
                    color: AppColors.secondaryColor,
                    fontWeight: FontWeight.w400),
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColors.secondaryColor,
                size: 18,
              )
            ],
          ),
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
