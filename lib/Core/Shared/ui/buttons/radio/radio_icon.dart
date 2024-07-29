import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Theme/Colors/app_colors.dart';
import '../../../../Theme/text/text_style.dart';
import '../../images/svg_display.dart';

class RadioIcon extends StatelessWidget {
  final String icon;
  final String title;
  final bool isChooised;
  final VoidCallback onClick;
  final Size? size;
  const RadioIcon({
    super.key,
    required this.icon,
    required this.title,
    this.isChooised = false,
    this.size,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        padding: EdgeInsets.only(bottom: 10.h, top: 3.h),
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(isChooised ? 0.15 : 0.08),
          borderRadius: BorderRadius.circular(
            10,
          ),
          border: Border.all(
            color: AppColors.primaryColor.withOpacity(0.16),
          ),
        ),
        width: 171,
        height: 168,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            isChooised
                ? Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            width: 1,
                            color: AppColors.secondaryColor,
                          ),
                        ),
                        child: const Icon(
                          Icons.circle,
                          size: 16,
                          color: AppColors.secondaryColor,
                        ),
                      ),
                    ],
                  )
                : const SizedBox(),
            const Spacer(),
            SvgDisplay(
              path: icon,
              size: size == null ? const Size(99, 93) : size!,
              //const Size(99, 93),
            ),
            Divider(
              color: AppColors.primaryColor.withOpacity(0.08),
              height: 0,
              indent: 0,
              thickness: 1,
            ),
            Text(
              title,
              style: AppTextStyle.smallBody.copyWith(
                color: AppColors.secondaryColor,
                fontWeight: isChooised ? FontWeight.w900 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
