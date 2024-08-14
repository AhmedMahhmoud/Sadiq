import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/Paths/svg_icons_paths.dart';
import 'package:sadiq/Core/Shared/ui/images/svg_display.dart';
import 'package:sadiq/Core/Theme/Colors/app_colors.dart';
import 'package:sadiq/Core/Theme/text/text_style.dart';
import 'package:sadiq/Features/Home/View/MyOrders/View/Widgets/item_tabbar.dart';

class OrderItemDetailsBS extends StatelessWidget {
  const OrderItemDetailsBS({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: 300.h, // Apply ScreenUtil's height conversion here
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Column(
            children: [
              Container(
                height: 20.h, // Apply ScreenUtil's height conversion here
                color: Colors.transparent,
              ),
              const ItemTapBar(),
            ],
          ),
          Positioned(
            right: 10.w,
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: 35.w,
                height: 35.h, // Adjust size for a circular button
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 4),
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.15),
                    ),
                  ],
                ),
                child: const Center(
                  child: SvgDisplay(path: SvgAssetsPaths.close),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
