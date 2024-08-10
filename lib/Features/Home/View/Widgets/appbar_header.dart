import 'package:flutter/material.dart';
import 'package:sadiq/Core/Paths/svg_icons_paths.dart';
import 'package:sadiq/Core/Shared/ui/images/svg_display.dart';

class AppbarHeader extends StatelessWidget implements PreferredSizeWidget {
  final Color? backGC;

  const AppbarHeader({super.key, this.backGC = Colors.white});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false, // Hide the default back button
      title: Row(
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
      ),
      backgroundColor: backGC, // Set the desired background color
      elevation: 0, // Set the desired elevation
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
