import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sadiq/Core/Shared/ui/images/svg_display.dart';
import 'package:sadiq/Core/Theme/Colors/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final String icon;
  final TextEditingController? controller;
  final double errorHeight;
  final String? Function(String?)? validator;
  final String? errorMsg;
  final double height;
  const CustomTextField(
      {Key? key,
      required this.hintText,
      this.icon = '',
      this.controller,
      this.validator,
      this.errorMsg,
      this.errorHeight = 40,
      this.height = 57})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  // ignore: prefer_final_fields
  bool _hasError = false;
  @override
  Widget build(BuildContext context) {
    return Container(
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
            widget.icon.isNotEmpty
                ? SizedBox(
                    width: 70.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgDisplay(
                          path: widget.icon,
                          size: const Size(20, 20),
                          color: AppColors.secondaryColor,
                        ),
                        VerticalDivider(
                          color: AppColors.secondaryColor.withOpacity(0.2),
                          thickness: 1,
                        ),
                      ],
                    ),
                  )
                : const SizedBox(),
            Expanded(
              child: SizedBox(
                height: _hasError || widget.errorMsg != null
                    ? widget.height + widget.errorHeight
                    : widget.height,
                child: TextFormField(
                  validator: widget.validator,
                  controller: widget.controller,
                  cursorColor: AppColors.secondaryColor,
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  decoration: InputDecoration(
                      errorText: widget.errorMsg,
                      contentPadding: const EdgeInsets.symmetric(vertical: 15),
                      hintText: widget.hintText,
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                          color: AppColors.secondaryColor.withOpacity(0.5))),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
