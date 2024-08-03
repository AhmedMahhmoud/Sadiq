import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/Paths/svg_icons_paths.dart';
import 'package:sadiq/Core/Shared/map/map_display.dart';
import 'package:sadiq/Core/Shared/ui/buttons/rounded/rounded_button.dart';
import 'package:sadiq/Core/Shared/ui/images/svg_display.dart';
import 'package:sadiq/Core/Theme/text/text_style.dart';
import 'package:sadiq/Features/Home/View/MyVechile/Views/screens/charging_stations_screen.dart';
import 'package:sadiq/Routes/route_naviation_service.dart';

class NearestChargingStations extends StatelessWidget {
  const NearestChargingStations({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'محطات الشحن',
                    style: AppTextStyle.bodyBold,
                  ),
                  const SvgDisplay(path: SvgAssetsPaths.charginStation),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  const SizedBox(
                    width: 315,
                    height: 160,
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: MapViewDisplay()),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: RoundedButton(
                        navigationArrowEnabled: true,
                        onPressed: () {
                          RouteNavService.navigateToPage(
                              const ChargingStationsScreen(), context);
                        },
                        title: 'عرض اقرب محطة شحن',
                        style: AppTextStyle.smallBodyBold
                            .copyWith(color: Colors.white)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
