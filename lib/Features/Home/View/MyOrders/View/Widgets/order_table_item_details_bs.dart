import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/Paths/svg_icons_paths.dart';
import 'package:sadiq/Core/Shared/map/map_display.dart';
import 'package:sadiq/Core/Shared/ui/buttons/rounded/circle_icon_button.dart';
import 'package:sadiq/Core/Shared/ui/images/svg_display.dart';
import 'package:sadiq/Core/Shared/ui/secondary_app_bar.dart';
import 'package:sadiq/Features/Home/View/MyOrders/View/Widgets/distance_time_indicator.dart';

import 'package:sadiq/Features/Home/View/MyOrders/View/Widgets/item_tabbar.dart';

class OrderItemDetailsBS extends StatelessWidget {
  final bool isNewOrder;
  const OrderItemDetailsBS({required this.isNewOrder, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: isNewOrder
          ? MediaQuery.sizeOf(context).height
          : 300.h, // Apply ScreenUtil's height conversion here
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              if (isNewOrder)
                Stack(
                  children: [
                    Center(
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          width: 340,
                          height: 224,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: const MapViewDisplay())),
                    ),
                    Positioned(
                        left: 40.w,
                        top: 10.h,
                        child: InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                                child: SvgDisplay(
                              path: SvgAssetsPaths.arrowLeft,
                            )),
                          ),
                        )),
                    Positioned(
                        bottom: 0,
                        left: 80.w,
                        child: const DistanceTimeIndicator(
                            distance: 'أنت على بعد ٢٥ كم',
                            bgColor: Colors.white,
                            time: 'ساعة و ٢٣ دقيقة'))
                  ],
                ),
              if (!isNewOrder)
                Container(
                  height: 20.h, // Apply ScreenUtil's height conversion here
                  color: Colors.transparent,
                ),
              ItemTapBar(isNewOrder: isNewOrder),
            ],
          ),
          if (!isNewOrder)
            Positioned(
              right: 10.w,
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: const CircleIconButton(iconPath: SvgAssetsPaths.close),
              ),
            ),
        ],
      ),
    );
  }
}
