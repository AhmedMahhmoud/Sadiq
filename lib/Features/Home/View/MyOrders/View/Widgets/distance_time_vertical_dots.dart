import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/Paths/svg_icons_paths.dart';
import 'package:sadiq/Core/Shared/ui/buttons/rounded/rounded_svg_container.dart';
import 'package:sadiq/Core/Theme/Colors/app_colors.dart';

class DistanceTimeVerticalDots extends StatelessWidget {
  final int noOfLines;
  const DistanceTimeVerticalDots({required this.noOfLines, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const RoundedSvgContainer(
          borderColor: AppColors.secondaryColor,
          backgroundColor: AppColors.primaryColor,
          borderWidth: 2,
          size: 35,
          svgPath: SvgAssetsPaths.gradientBox,
        ),
        const BuildConnectingLine(),
        ..._buildVerticalDots(noOfLines),
        const RoundedSvgContainer(
          borderColor: AppColors.secondaryColor,
          backgroundColor: AppColors.primaryColor,
          borderWidth: 2,
          size: 35,
          svgPath: SvgAssetsPaths.gradientlocation,
        ),
      ],
    );
  }

  List<Widget> _buildVerticalDots(int noOFLines) {
    return List.generate(
      noOFLines,
      (_) => Container(
        margin: const EdgeInsets.symmetric(vertical: 2),
        width: 2.w,
        height: 4.5.h,
        color: AppColors.secondaryColor.withOpacity(0.20),
      ),
    );
  }
}

class BuildConnectingLine extends StatelessWidget {
  const BuildConnectingLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 3,
      height: 5,
      color: AppColors.secondaryColor.withOpacity(0.20),
    );
  }
}
