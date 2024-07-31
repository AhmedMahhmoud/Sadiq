import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Theme/Colors/app_colors.dart';

class BackBtn extends StatelessWidget {
  final VoidCallback onClick;
  const BackBtn({
    super.key,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        height: 39.59.h,
        width: 39.59.w,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: const Center(
          child: Icon(
            Icons.arrow_forward_ios_outlined,
            color: AppColors.secondaryColor,
          ),
        ),
      ),
    );
  }
}
