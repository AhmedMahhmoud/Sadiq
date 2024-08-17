import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/Paths/svg_icons_paths.dart';
import 'package:sadiq/Core/Shared/ui/buttons/rounded/circle_icon_button.dart';

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
              child: CircleIconButton(iconPath: SvgAssetsPaths.close),
            ),
          ),
        ],
      ),
    );
  }
}
