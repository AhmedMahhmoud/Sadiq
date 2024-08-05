import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sadiq/Core/Theme/Colors/app_colors.dart';

class SvgDisplay extends StatelessWidget {
  final String path;
  final Size? size;
  final BoxFit? boxFit;
  final Color? color;
  const SvgDisplay({
    required this.path,
    this.size,
    this.color,
    this.boxFit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      width: size?.width,
      height: size?.height,
      fit: boxFit ?? BoxFit.fill,
      // ignore: deprecated_member_use
      color: color,
    );
  }
}

class SvgInsideCircle extends StatelessWidget {
  final String path;

  final BoxDecoration? decoration;
  const SvgInsideCircle({
    required this.path,
    this.decoration,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: decoration ??
          const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.iconsBackgroundColor,
          ),
      child: Center(
        child: SvgDisplay(path: path),
      ),
    );
  }
}
