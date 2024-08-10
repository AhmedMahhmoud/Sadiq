import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/Paths/svg_icons_paths.dart';
import 'package:sadiq/Core/Shared/ui/buttons/rounded/rounded_svg_container.dart';
import 'package:sadiq/Core/Theme/Colors/app_colors.dart';

class DistanceTimeVerticalDots extends StatelessWidget {
  const DistanceTimeVerticalDots({Key? key}) : super(key: key);

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
        _buildConnectingLine(),
        ..._buildVerticalDots(),
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

  Widget _buildConnectingLine() {
    return Container(
      width: 3,
      height: 5,
      color: AppColors.secondaryColor.withOpacity(0.20),
    );
  }

  List<Widget> _buildVerticalDots() {
    return List.generate(
      4,
      (_) => Container(
        margin: const EdgeInsets.symmetric(vertical: 2),
        width: 2.w,
        height: 4.5.h,
        color: AppColors.secondaryColor.withOpacity(0.20),
      ),
    );
  }
}
