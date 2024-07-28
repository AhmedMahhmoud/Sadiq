import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/Paths/svg_icons_paths.dart';
import 'package:sadiq/Core/Theme/Colors/app_colors.dart';
import 'package:sadiq/Features/Home/View/MyVechile/Views/widgets/vechile_trip_info.dart';

class VehcileRecordsInfoList extends StatelessWidget {
  const VehcileRecordsInfoList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffE8EEFF),
      child: Column(
        children: [
          Divider(
            thickness: 2,
            color: AppColors.secondaryColor.withOpacity(0.2),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                const VechileTripInfo(
                    icon: SvgAssetsPaths.completeRequests,
                    title: 'الطلبات الناجحة',
                    value: '٨',
                    valueType: 'طلبات'),
                Divider(
                  thickness: 2,
                  color: AppColors.secondaryColor.withOpacity(0.2),
                ),
                const VechileTripInfo(
                    icon: SvgAssetsPaths.distance,
                    title: 'الاميال المقطوعة',
                    value: '٨',
                    valueType: 'كيلو/م'),
                Divider(
                  thickness: 2,
                  color: AppColors.secondaryColor.withOpacity(0.2),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
