import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/Paths/svg_icons_paths.dart';
import 'package:sadiq/Core/Shared/ui/images/svg_display.dart';
import 'package:sadiq/Features/BottomNav/bloc/home_bloc.dart';
import 'package:sadiq/Features/Notification/View/Screen/notification.dart';
import 'package:sadiq/Features/support/View/Screens/support.dart';

class SecondaryAppHeader extends StatelessWidget {
  final Color bgColor;
  final bool enablePopFirst;
  const SecondaryAppHeader({
    this.bgColor = Colors.white,
    this.enablePopFirst = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      height: 30.h,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            const SvgDisplay(path: SvgAssetsPaths.logoHorizontal),
            Expanded(child: Container()),
            InkWell(
              onTap: () {
                if (enablePopFirst) {
                  Navigator.pop(context);
                }
                context
                    .read<HomeBloc>()
                    .add(PushPageWithBottomNav(const SupportScreen()));
              },
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
      ),
    );
  }
}
