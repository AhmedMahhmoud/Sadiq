import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/Paths/svg_icons_paths.dart';
import 'package:sadiq/Core/Shared/ui/images/svg_display.dart';

class DisplayAppTitleWithLogo extends StatelessWidget {
  final Size? appIconsize;
  final Size? appTitleSize;
  const DisplayAppTitleWithLogo({
    this.appIconsize,
    this.appTitleSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgDisplay(
          path: SvgAssetsPaths.appIcon,
          size: appIconsize,
        ),
        const SizedBox(
          height: 5,
        ),
        SvgDisplay(
          path: SvgAssetsPaths.appTitle,
          size: appTitleSize,
        )
      ],
    );
  }
}
