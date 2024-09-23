import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/CommonData/Models/city_model.dart';

import '../../../Paths/svg_icons_paths.dart';
import '../../../Theme/Colors/app_colors.dart';
import '../images/svg_display.dart';

class CustomDropDown<T> extends StatefulWidget {
  const CustomDropDown({
    super.key,
    required this.options,
    required this.hintText,
    required this.onchange,
    required this.locationIcon,
    required this.selectedOption,
    required this.itemToString, // Function to convert item T to string
  });
  final String hintText;
  final String locationIcon;
  final List<T> options;
  final Function(T?) onchange;
  final T? selectedOption;
  final String Function(T) itemToString;

  @override
  State<CustomDropDown<T>> createState() => _CustomDropDownState<T>();
}

bool _haserror = false;

class _CustomDropDownState<T> extends State<CustomDropDown<T>> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      padding: const EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
        color: AppColors.fieldsBGfillColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: _haserror
              ? AppColors.errorColor
              : AppColors.secondaryColor.withOpacity(0.2),
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
                  path: widget.locationIcon,
                  size: const Size(22, 22),
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
            child: DropdownButtonFormField<T>(
              decoration: const InputDecoration.collapsed(hintText: ''),
              validator: (value) {
                if (value == null) {
                  setState(() {
                    _haserror = true;
                  });
                } else {
                  setState(() {
                    _haserror = false;
                  });
                }
                return null;
              },
              menuMaxHeight: 300,
              icon: const Icon(
                Icons.keyboard_arrow_down_sharp,
                color: AppColors.secondaryColor,
              ),
              value: widget.selectedOption,
              items: widget.options.map((value) {
                return DropdownMenuItem<T>(
                  value: value,
                  child: Text(
                    widget.itemToString(value),
                  ),
                );
              }).toList(),
              hint: Text(
                widget.hintText,
                style: TextStyle(
                    color: widget.selectedOption == null
                        ? AppColors.secondaryColor.withOpacity(0.5)
                        : AppColors.secondaryColor),
              ),
              borderRadius: BorderRadius.circular(10),
              isExpanded: true,
              onChanged: widget.onchange,
            ),
          ),
        ],
      ),
    );
  }
}
