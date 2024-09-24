import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/Theme/Colors/app_colors.dart';
import 'package:sadiq/Core/Theme/text/text_style.dart';

class RadioImageIcon extends StatelessWidget {
  final String? imageUrl;
  final String title;
  final bool isChooised;
  final VoidCallback onClick;
  final Size? size;

  const RadioImageIcon({
    super.key,
    required this.imageUrl,
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
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.primaryColor.withOpacity(0.16),
          ),
        ),
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
            imageUrl != null
                ? Image.network(
                    imageUrl!,
                    height: size?.height ?? 50.h,
                    width: size?.width ?? 50.w,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(Icons.error, size: 50.h);
                    },
                  )
                : Icon(Icons.image_not_supported,
                    size: 50.h), // Placeholder when no image is provided
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
