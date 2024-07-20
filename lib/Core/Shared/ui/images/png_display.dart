import 'package:flutter/material.dart';

class PngDisplay extends StatelessWidget {
  final String path;
  final Size? size;
  final BoxFit? boxFit;
  const PngDisplay({
    required this.path,
    this.size,
    this.boxFit,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      fit: boxFit ?? BoxFit.fill,
      height: size?.height,
      width: size?.width,
    );
  }
}
