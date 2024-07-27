import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Paths/svg_icons_paths.dart';
import '../../../Theme/Colors/app_colors.dart';
import '../images/svg_display.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    super.key,
    required this.options,
    required this.onchange,
    required this.selectedOption,
  });

  final List<String> options;
  final Function onchange;
  final String selectedOption;

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
                SvgDisplay(
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
            child: DropdownButton<String>(
              menuMaxHeight: 300,
              icon: const Icon(
                Icons.keyboard_arrow_down_sharp,
                color: AppColors.secondaryColor,
              ),
              items: options.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                  ),
                );
              }).toList(),
              hint: Text(
                selectedOption.isEmpty ? 'اختر المدينة' : selectedOption,
                style: TextStyle(
                    color: selectedOption.isEmpty
                        ? AppColors.secondaryColor.withOpacity(0.5)
                        : AppColors.secondaryColor),
              ),
              borderRadius: BorderRadius.circular(10),
              underline: const SizedBox(),
              isExpanded: true,
              onChanged: (value) {
                onchange(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
