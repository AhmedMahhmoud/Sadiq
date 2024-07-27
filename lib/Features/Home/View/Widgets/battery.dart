import 'package:cupertino_battery_indicator/cupertino_battery_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/Theme/Colors/app_colors.dart';
import 'package:sadiq/Core/Theme/text/text_style.dart';

// Helper function to get battery color based on value
Color getBatteryColor(double value) {
  if (value > 0.5) {
    return const Color(0xff44E08C);
  } else if (value > 0.25) {
    return Colors.orange;
  } else {
    return Colors.red;
  }
}

class AnimatedBatteryIndicator extends StatelessWidget {
  final double endValue;
  final Duration duration;
  final String iconText;

  const AnimatedBatteryIndicator({
    Key? key,
    required this.endValue,
    this.duration = const Duration(milliseconds: 1500),
    required this.iconText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: endValue),
      curve: Curves.easeOut,
      duration: duration,
      builder: (context, animatedValue, child) {
        final batteryPercentage = (animatedValue * 100).toInt();
        final iconText = '$batteryPercentage٪';
        return BatteryIndicator(
          value: animatedValue,
          trackHeight: 50.0,
          iconOutlineBlur: 1.0,
          barColor: getBatteryColor(animatedValue),
          icon: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              iconText,
              style: AppTextStyle.body.copyWith(
                  color: AppColors.secondaryColor.withOpacity(0.5),
                  fontSize: 22.sp),
            ),
          ),
          trackBorderColor: AppColors.secondaryColor,
          trackColor: Colors.white,
          trackAspectRatio: 2.1,
          barBorderRadius: BorderRadius.circular(6),
          trackPadding: 3,
          trackBorderRadius: BorderRadius.circular(6),
          withKnob: true,
          iconOutline: Colors.white,
        );
      },
    );
  }
}
