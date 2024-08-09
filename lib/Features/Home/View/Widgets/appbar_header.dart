import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadiq/Core/Paths/svg_icons_paths.dart';
import 'package:sadiq/Core/Shared/ui/images/svg_display.dart';
import 'package:sadiq/Features/BottomNav/bloc/home_bloc.dart';
import 'package:sadiq/Features/Notification/View/Screen/notification.dart';
import 'package:sadiq/Features/support/View/Screens/support.dart';

class AppbarHeader extends StatelessWidget implements PreferredSizeWidget {
  const AppbarHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false, // Hide the default back button
      title: Row(
        children: [
          const SvgDisplay(path: SvgAssetsPaths.logoHorizontal),
          Expanded(child: Container()),
          InkWell(
            onTap: () => context
              ..read<HomeBloc>()
                  .add(PushPageWithBottomNav(const SupportScreen())),
            child: const SvgInsideCircle(
              path: SvgAssetsPaths.support,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () => context
                .read<HomeBloc>()
                .add(PushPageWithBottomNav(const NotificationScreen())),
            child: const SvgInsideCircle(
              path: SvgAssetsPaths.notificationBell,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white, // Set the desired background color
      elevation: 0, // Set the desired elevation
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
