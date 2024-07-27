import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/Paths/svg_icons_paths.dart';
import 'package:sadiq/Core/Shared/ui/images/svg_display.dart';
import 'package:sadiq/Core/Theme/Colors/app_colors.dart';
import 'package:sadiq/Features/BottomNav/bloc/home_bloc.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  void _onPageSelected(int index) {
    final homebloc = BlocProvider.of<HomeBloc>(context);
    homebloc.add(HomeTappedEvent(index));
  }

  @override
  Widget build(BuildContext context) {
    return _buildBottomNavigationBar();
  }

  Widget _buildBottomNavigationBar() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 30.h),
            SvgDisplay(path: SvgAssetsPaths.bottomNav),
          ],
        ),
        Positioned(
          top: 15.h,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SvgDisplay(path: SvgAssetsPaths.circleGradient),
              SvgDisplay(path: SvgAssetsPaths.box),
            ],
          ),
        ),
        _buildNavItem(
          position: Alignment.bottomLeft,
          offset: Offset(100.w, 10.h),
          index: 2,
          selectedPath: SvgAssetsPaths.selectedAccNav,
          unselectedPath: SvgAssetsPaths.unSelectedAccNav,
        ),
        _buildNavItem(
          position: Alignment.bottomRight,
          offset: Offset(100.w, 10.h),
          index: 0,
          selectedPath: SvgAssetsPaths.selectedVechileNav,
          unselectedPath: SvgAssetsPaths.unSelectedVechileNav,
        ),
        _buildCentralNavItem(
          topOffset: 55.h,
          index: 1,
          label: 'الطلبات',
        ),
      ],
    );
  }

  Widget _buildNavItem({
    required Alignment position,
    required Offset offset,
    required int index,
    required String selectedPath,
    required String unselectedPath,
  }) {
    return Positioned(
      left: position == Alignment.bottomLeft ? offset.dx : null,
      right: position == Alignment.bottomRight ? offset.dx : null,
      bottom: offset.dy,
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return FadeIn(
            child: InkWell(
              onTap: () => _onPageSelected(index),
              child: SvgDisplay(
                path:
                    state.currentIndex == index ? selectedPath : unselectedPath,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCentralNavItem({
    required double topOffset,
    required int index,
    required String label,
  }) {
    return Positioned(
      top: topOffset,
      child: InkWell(
        onTap: () => _onPageSelected(index),
        child: ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) {
            return AppColors.appLinearGradient.createShader(
              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
            );
          },
          child: Text(
            label,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
