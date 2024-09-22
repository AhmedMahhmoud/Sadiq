import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/CommonData/Models/city_model.dart';

import '../../../Paths/svg_icons_paths.dart';
import '../../../Theme/Colors/app_colors.dart';
import '../images/svg_display.dart';

class CustomDropDown<T> extends StatelessWidget {
  const CustomDropDown({
    super.key,
    required this.options,
    required this.hintText,
    required this.onchange,
    required this.selectedOption,
    required this.itemToString, // Function to convert item T to string
  });
  final String hintText;
  final List<T> options;
  final Function(T?) onchange;
  final T? selectedOption;
  final String Function(T) itemToString;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      padding: const EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
        color: AppColors.fieldsBGfillColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.secondaryColor.withOpacity(0.2),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 70.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SvgDisplay(
                  path: SvgAssetsPaths.location,
                  size: Size(22, 22),
                  color: AppColors.secondaryColor,
                ),
                Container(
                  color: AppColors.secondaryColor.withOpacity(0.2),
                  width: 0.5,
                  height: 30.h,
                ),
              ],
            ),
          ),
          Expanded(
            child: DropdownButton<T>(
              menuMaxHeight: 300,
              icon: const Icon(
                Icons.keyboard_arrow_down_sharp,
                color: AppColors.secondaryColor,
              ),
              value: selectedOption,
              items: options.map((value) {
                return DropdownMenuItem<T>(
                  value: value,
                  child: Text(
                    itemToString(value),
                  ),
                );
              }).toList(),
              hint: Text(
                hintText,
                style: TextStyle(
                    color: selectedOption == null
                        ? AppColors.secondaryColor.withOpacity(0.5)
                        : AppColors.secondaryColor),
              ),
              borderRadius: BorderRadius.circular(10),
              underline: const SizedBox(),
              isExpanded: true,
              onChanged: onchange,
            ),
          ),
        ],
      ),
    );
  }
}
