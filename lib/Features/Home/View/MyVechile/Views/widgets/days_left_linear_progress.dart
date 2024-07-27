import 'package:flutter/material.dart';
import 'package:sadiq/Core/Theme/Colors/app_colors.dart';

class DaysLeftLinearProgress extends StatelessWidget {
  const DaysLeftLinearProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: TweenAnimationBuilder<double>(
            tween: Tween<double>(
                begin: 0.0,
                end: 0.1), // Adjust the end value based on your progress logic
            duration: const Duration(seconds: 1), // Duration for the animation
            builder: (context, value, _) {
              return LinearProgressIndicator(
                value: value,
                backgroundColor: AppColors.progressColor,
                valueColor:
                    const AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
                minHeight: 9.0,
              );
            },
          ),
        ),
      ),
    );
  }
}
