import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sadiq/Core/Shared/ui/images/svg_display.dart';
import 'package:sadiq/Core/Theme/Colors/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String icon;
  final TextEditingController? controller;

  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.icon,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: AppColors.fieldsBGfillColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.secondaryColor.withOpacity(0.2),
          ),
        ),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  cursorColor: AppColors.secondaryColor,
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 15),
                      hintText: hintText,
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                          color: AppColors.secondaryColor.withOpacity(0.5))),
                  textAlign: TextAlign.right,
                ),
              ),
              SizedBox(
                width: 70.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    VerticalDivider(
                      color: AppColors.secondaryColor.withOpacity(0.2),
                      thickness: 1,
                    ),
                    SvgDisplay(
                      path: icon,
                      size: const Size(20, 20),
                      color: AppColors.secondaryColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
