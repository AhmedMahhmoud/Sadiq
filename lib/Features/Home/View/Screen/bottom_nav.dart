import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/Paths/svg_icons_paths.dart';
import 'package:sadiq/Core/Shared/ui/images/svg_display.dart';
import 'package:sadiq/Core/Shared/ui/form/gradient_text.dart';
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
        // Cloud-like shadow background
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 25,
                  offset: const Offset(0, 10),
                ),
                BoxShadow(
                  color: Colors.white.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 60,
                  offset: const Offset(0, 20),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 30.h),
              const SvgDisplay(path: SvgAssetsPaths.bottomNav),
            ],
          ),
        ),
        Positioned(
          top: 15.h,
          child: InkWell(
            onTap: () => _onPageSelected(1),
            child: const Stack(
              alignment: Alignment.center,
              children: [
                SvgDisplay(path: SvgAssetsPaths.circleGradient),
                SvgDisplay(path: SvgAssetsPaths.box),
              ],
            ),
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
        child: GradientText(
            label: label,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500)),
      ),
    );
  }
}
