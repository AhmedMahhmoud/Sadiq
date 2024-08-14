import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Core/Theme/Colors/app_colors.dart';
import '../../../Core/Theme/text/text_style.dart';

class TermsAndPolicyCard extends StatelessWidget {
  final String title;
  final String description;
  const TermsAndPolicyCard({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400.w,
      margin: EdgeInsets.symmetric(vertical: 5.h),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: AppColors.secondaryColor.withOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyle.subheadline.copyWith(
              color: AppColors.secondaryColor,
            ),
          ),
          Text(
            description,
            style: AppTextStyle.caption.copyWith(
              color: AppColors.secondaryColor,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
