import 'package:flutter/material.dart';
import 'package:sadiq/Core/Paths/svg_icons_paths.dart';
import 'package:sadiq/Core/Shared/ui/images/svg_display.dart';

class AppbarHeader extends StatelessWidget {
  const AppbarHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SvgDisplay(path: SvgAssetsPaths.logoHorizontal),
        Expanded(child: Container()),
        const SvgInsideCircle(
          path: SvgAssetsPaths.support,
        ),
        const SizedBox(
          width: 10,
        ),
        const SvgInsideCircle(
          path: SvgAssetsPaths.notificationBell,
        ),
      ],
    );
  }
}
