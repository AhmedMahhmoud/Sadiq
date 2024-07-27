import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/Paths/svg_icons_paths.dart';
import 'package:sadiq/Core/Shared/ui/images/svg_display.dart';
import 'package:sadiq/Core/Theme/Colors/app_colors.dart';
import 'package:sadiq/Core/Theme/text/text_style.dart';

import 'package:sadiq/Features/Home/View/Widgets/appbar_header.dart';
import 'package:sadiq/Features/Home/View/Widgets/battery.dart';
import 'package:sadiq/Features/Home/View/Widgets/vehicle_info_rounded.dart';
import 'package:sadiq/Features/Home/View/Widgets/vehicle_status.dart';

class MyVechile extends StatelessWidget {
  const MyVechile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(blurRadius: 15, color: Colors.black.withOpacity(0.2))
          ],
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.r),
              bottomRight: Radius.circular(20.r))),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const AppbarHeader(),
            SizedBox(
              height: 10.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Column(
                      children: [
                        const VehicleInfoRoundedCard(
                          title: 'مسافة متبقية',
                          valueUnit: 'كم',
                          value: '٦٤',
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        const AnimatedBatteryIndicator(
                          endValue: 0.56,
                          iconText: '٥٦٪',
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        const VehicleInfoRoundedCard(
                          title: 'شحن متبقية',
                          valueUnit: 'مرات',
                          value: '١٢',
                        )
                      ],
                    ),
                  ),
                ),
                const Expanded(
                  flex: 3,
                  child: VechileStatus(),
                ),
              ],
            ),
            Divider(
              thickness: 1,
              color: AppColors.secondaryColor.withOpacity(0.2),
            ),
            Row(
              children: [
                Text('حي الياسمين - الرياض - المملكة العربية السعودية'),
                SvgDisplay(path: SvgAssetsPaths.location),
              ],
            )
          ],
        ),
      ),
    );
  }
}
