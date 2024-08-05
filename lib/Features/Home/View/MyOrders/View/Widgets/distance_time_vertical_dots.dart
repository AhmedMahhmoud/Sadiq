import 'package:flutter/material.dart';
import 'package:sadiq/Core/Paths/svg_icons_paths.dart';
import 'package:sadiq/Core/Shared/ui/images/svg_display.dart';
import 'package:sadiq/Core/Theme/Colors/app_colors.dart';

class DistanceTimeVerticalDots extends StatelessWidget {
  const DistanceTimeVerticalDots({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(
                  width: 2, color: AppColors.secondaryColor.withOpacity(0.20)),
              shape: BoxShape.circle,
              color: AppColors.primaryColor.withOpacity(0.05)),
          child: const Center(
            child: SvgDisplay(
              path: SvgAssetsPaths.gradientBox,
              size: Size(20, 20),
            ),
          ),
        ),
        Container(
          width: 3,
          height: 5,
          color: AppColors.secondaryColor.withOpacity(0.20),
        ),
        for (int i = 0; i < 4; i++)
          Container(
            margin: const EdgeInsets.symmetric(vertical: 2),
            width: 3,
            height: 7,
            color: AppColors.secondaryColor.withOpacity(0.20),
          ),
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
              border: Border.all(
                  width: 2, color: AppColors.secondaryColor.withOpacity(0.20)),
              shape: BoxShape.circle,
              color: AppColors.primaryColor.withOpacity(0.05)),
          child: const Center(
            child: SvgDisplay(
              path: SvgAssetsPaths.gradientlocation,
              size: Size(20, 20),
            ),
          ),
        ),
      ],
    );
  }
}
