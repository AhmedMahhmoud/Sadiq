import 'package:flutter/material.dart';
import 'package:sadiq/Core/Paths/svg_icons_paths.dart';
import 'package:sadiq/Core/Shared/ui/images/svg_display.dart';
import 'package:sadiq/Core/Theme/Colors/app_colors.dart';
import 'package:animate_do/animate_do.dart';

class CustomCheckMark extends StatefulWidget {
  final bool enabled;
  final VoidCallback onChanged;
  const CustomCheckMark(
      {required this.enabled, required this.onChanged, super.key});

  @override
  State<CustomCheckMark> createState() => _CustomCheckMarkState();
}

class _CustomCheckMarkState extends State<CustomCheckMark> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onChanged,
      child: AnimatedContainer(
        curve: Curves.easeIn,
        width: widget.enabled ? 25 : 15,
        height: widget.enabled ? 25 : 15,
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.enabled ? 6 : 4),
            border: Border.all(width: 2, color: AppColors.secondaryColor)),
        child: widget.enabled
            ? Padding(
                padding: const EdgeInsets.all(2),
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColors.primaryColor),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: FadeIn(
                      child: SvgDisplay(
                        path: SvgAssetsPaths.checkmark,
                      ),
                    ),
                  ),
                ),
              )
            : const SizedBox(),
      ),
    );
  }
}
