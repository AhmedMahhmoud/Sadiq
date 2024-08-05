import 'package:flutter/material.dart';
import 'package:sadiq/Core/Paths/svg_icons_paths.dart';
import 'package:sadiq/Core/Shared/ui/images/svg_display.dart';
import 'package:sadiq/Core/Theme/Colors/app_colors.dart';
import 'package:sadiq/Core/Theme/text/text_style.dart';
import 'package:sadiq/Features/Home/View/MyVechile/Views/widgets/vechile_info.dart';

import 'package:sadiq/Features/Home/View/Widgets/vehicle_status.dart';

class DisplayVechile extends StatelessWidget {
  const DisplayVechile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: VechileStatus(),
              ),
              Expanded(
                flex: 2,
                child: VechileInfo(),
              ),
            ],
          ),
          Divider(
            thickness: 1,
            color: AppColors.secondaryColor.withOpacity(0.2),
          ),
          Row(
            children: [
              SvgDisplay(
                  path: SvgAssetsPaths.location, color: AppColors.primaryColor),
              const SizedBox(
                width: 10,
              ),
              Text(
                'حي الياسمين - الرياض - المملكة العربية السعودية',
                style: AppTextStyle.smallBody,
              ),
            ],
          )
        ],
      ),
    );
  }
}
