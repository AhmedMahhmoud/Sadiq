import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Features/Home/View/Widgets/battery.dart';

import 'package:sadiq/Features/Home/View/Widgets/vehicle_info_rounded.dart';

class VechileInfo extends StatelessWidget {
  const VechileInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
