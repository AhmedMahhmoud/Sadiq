import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/Paths/svg_icons_paths.dart';
import 'package:sadiq/Core/Shared/ui/images/svg_display.dart';

class DisplayAppTitleWithLogo extends StatelessWidget {
  const DisplayAppTitleWithLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgDisplay(
          path: SvgAssetsPaths.appIcon,
        ),
        SizedBox(
          height: 10.h,
        ),
        SvgDisplay(path: SvgAssetsPaths.appTitle)
      ],
    );
  }
}
