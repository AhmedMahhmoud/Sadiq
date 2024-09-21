import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/Paths/image_paths.dart';
import 'package:sadiq/Core/Paths/svg_icons_paths.dart';
import 'package:sadiq/Core/Shared/ui/images/png_display.dart';
import 'package:sadiq/Core/Shared/ui/images/svg_display.dart';
import 'package:sadiq/Core/Theme/Colors/app_colors.dart';
import 'package:sadiq/Core/Theme/text/text_style.dart';

class VechileStatus extends StatelessWidget {
  const VechileStatus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SvgDisplay(
                path: SvgAssetsPaths.vehicleType,
                size: Size(32, 18),
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                'حالة المركبة',
                style: AppTextStyle.headline.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.secondaryColor),
              ),
            ],
          ),
          Text(
            'نوع المركبة',
            style: AppTextStyle.smallBodyBold
                .copyWith(color: AppColors.primaryColor),
          ),
          SizedBox(
            height: 10.h,
          ),
          SlideInRight(
            duration: const Duration(milliseconds: 1200),
            child: SizedBox(
              width: 200,
              height: 150,
              child: PngDisplay(path: PngAssetsPaths.vehiclePng),
            ),
          )
        ],
      ),
    );
  }
}
