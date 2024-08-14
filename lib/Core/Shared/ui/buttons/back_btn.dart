import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Routes/route_naviation_service.dart';
import '../../../Theme/Colors/app_colors.dart';

class BackBtn extends StatelessWidget {
  final double width;
  final double height;
  final double? iconSize;
  final VoidCallback? onClick;
  const BackBtn({
    super.key,
    this.onClick,
    required this.width,
    required this.height,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick ??
          () {
            RouteNavService.popPage(context);
          },
      child: Container(
        padding: EdgeInsets.only(right: 2.w),
        height: height.h,
        width: width.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withOpacity(0.8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 13,
              spreadRadius: 4,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Icon(
            Icons.arrow_forward_ios_outlined,
            color: AppColors.secondaryColor,
            size: iconSize ?? 24,
          ),
        ),
      ),
    );
  }
}
