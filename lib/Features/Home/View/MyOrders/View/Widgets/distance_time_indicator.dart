import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/Theme/Colors/app_colors.dart';
import 'package:sadiq/Core/Theme/text/text_style.dart';

class DistanceTimeIndicator extends StatelessWidget {
  final String distance;
  final String time;
  final TextStyle? style;
  const DistanceTimeIndicator({
    Key? key,
    required this.distance,
    required this.time,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      height: 30,
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.05),
        border: Border.all(
          width: 1,
          color: AppColors.secondaryColor.withOpacity(0.20),
        ),
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: DistanceTimeIndicatorContent(distance: distance, time: time),
    );
  }
}

class DistanceTimeIndicatorContent extends StatelessWidget {
  const DistanceTimeIndicatorContent({
    super.key,
    required this.distance,
    required this.time,
    this.style,
  });

  final String distance;
  final String time;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          distance,
          style: style ??
              AppTextStyle.smallBodyBold
                  .copyWith(fontSize: 11.sp, color: AppColors.primaryColor),
        ),
        const SizedBox(
          width: 5,
        ),
        Container(
          width: 5,
          height: 5,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primaryColor,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          time,
          style: style ??
              AppTextStyle.smallBodyBold
                  .copyWith(fontSize: 11.sp, color: AppColors.primaryColor),
        ),
      ],
    );
  }
}
