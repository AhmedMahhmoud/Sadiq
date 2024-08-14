import 'package:flutter/material.dart';
import 'package:sadiq/Core/Shared/ui/images/svg_display.dart';

class RoundedSvgContainer extends StatelessWidget {
  final Color borderColor;
  final Color backgroundColor;
  final double borderWidth;
  final double size;
  final String svgPath;

  const RoundedSvgContainer({
    Key? key,
    required this.borderColor,
    required this.backgroundColor,
    required this.borderWidth,
    required this.size,
    required this.svgPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(
          width: borderWidth,
          color: borderColor.withOpacity(0.20),
        ),
        shape: BoxShape.circle,
        color: backgroundColor.withOpacity(0.05),
      ),
      child: Center(
        child: SvgDisplay(
          path: svgPath,
          size: Size(size * 0.50, size * 0.50),
        ),
      ),
    );
  }
}
