import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/Paths/svg_icons_paths.dart';
import 'package:sadiq/Core/Shared/map/map_display.dart';
import 'package:sadiq/Core/Shared/ui/buttons/rounded/rounded_button.dart';
import 'package:sadiq/Core/Shared/ui/images/svg_display.dart';
import 'package:sadiq/Core/Shared/ui/secondary_app_bar.dart';
import 'package:sadiq/Core/Theme/Colors/app_colors.dart';
import 'package:sadiq/Core/Theme/text/text_style.dart';
import 'package:sadiq/Features/Home/View/MyVechile/Views/widgets/charging_station/chargin_list_display.dart';

class ChargingStationsScreen extends StatelessWidget {
  const ChargingStationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SecondaryAppHeader(
          bgColor: Colors.white,
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              const MapViewDisplay(),
              Positioned(
                top: 5.h,
                right: 5.w,
                child: RoundedButton(
                  onPressed: () {},
                  btnColor: AppColors.secondaryColor,
                  title: 'محطات الشحن',
                  btnSize: const Size(170, 50),
                  iconWidget: const SvgDisplay(
                    path: SvgAssetsPaths.charginStation,
                    color: Colors.white,
                  ),
                  style: AppTextStyle.bodyBold
                      .copyWith(fontSize: 14, color: Colors.white),
                ),
              ),
              Positioned(
                  bottom: 65.h,
                  child: SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      height: 200.h,
                      child: const StationList()))
            ],
          ),
        ),
      ],
    );
  }
}
