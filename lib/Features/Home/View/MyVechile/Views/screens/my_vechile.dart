import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/Paths/svg_icons_paths.dart';
import 'package:sadiq/Core/Shared/ui/buttons/rounded/rounded_button.dart';
import 'package:sadiq/Core/Shared/ui/cards/home_rounded_bottom_card.dart';
import 'package:sadiq/Core/Shared/ui/images/svg_display.dart';
import 'package:sadiq/Core/Theme/Colors/app_colors.dart';
import 'package:sadiq/Core/Theme/text/text_style.dart';
import 'package:sadiq/Features/Home/View/MyVechile/Views/widgets/days_left_linear_progress.dart';
import 'package:sadiq/Features/Home/View/MyVechile/Views/widgets/nearest_charing_stations.dart';
import 'package:sadiq/Features/Home/View/MyVechile/Views/widgets/records_info_list.dart';
import 'package:sadiq/Features/Home/View/MyVechile/Views/widgets/vehicle_day_selection.dart';
import 'package:sadiq/Features/Home/View/MyVechile/Views/widgets/vehicle_remaining_day_display.dart';
import '../widgets/display_vechile.dart';

class MyVechile extends StatelessWidget {
  const MyVechile({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(children: [
        HomeRoundedBottomCard(
          widget: const DisplayVechile(),
          height: 85.h,
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.40,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Colors.white.withOpacity(0.1),
                  AppColors.fieldsBGfillColor
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const VehickeRemainingDaysDisplay(),
                            const SizedBox(
                              height: 10,
                            ),
                            const DaysLeftLinearProgress(),
                            SizedBox(
                              height: 10.h,
                            ),
                            Center(
                              child: RoundedButton(
                                onPressed: () {},
                                style: AppTextStyle.bodyBold.copyWith(
                                    color: Colors.white, fontSize: 14),
                                title: 'تجديد الخدمة',
                                iconWidget: const SvgDisplay(
                                    path: SvgAssetsPaths.renew,
                                    size: Size(25, 20)),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const VehicleDaySelection(),
                            const SizedBox(
                              height: 10,
                            )
                          ],
                        )),
                    const SizedBox(
                      height: 5,
                    )
                  ],
                ),
              ),
              const VehcileRecordsInfoList(),
              const NearestChargingStations(),
              SizedBox(
                height: 100.h,
              )
            ],
          ),
        )
      ]),
    );
  }
}
