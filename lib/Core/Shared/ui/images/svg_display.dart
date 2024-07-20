import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

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
      color: color,
    );
  }
}
