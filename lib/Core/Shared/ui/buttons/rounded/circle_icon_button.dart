import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/Shared/ui/images/svg_display.dart';

class CircleIconButton extends StatelessWidget {
  final String iconPath;
  const CircleIconButton({
    required this.iconPath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Center(
        child: SvgDisplay(path: iconPath),
      ),
    );
  }
}
