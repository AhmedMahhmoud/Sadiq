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
  final Color bGColor;
  final String? initialValue;
  final Color iconColor;
  final TextInputType textInputType;
  final bool obscureText;
  final TextInputAction textInputAction;
  final bool enableValidation;
  final String? Function(String?)? onFieldSubmitted;
  final String? Function(String?)? onSaved;
  const CustomTextField({
    Key? key,
    required this.hintText,
    this.icon = '',
    this.onSaved,
    this.controller,
    this.validator,
    this.onFieldSubmitted,
    this.enableValidation = true,
    this.errorMsg,
    this.initialValue,
    this.errorHeight = 1,
    this.height = 57,
    this.bGColor = AppColors.fieldsBGfillColor,
    this.iconColor = AppColors.secondaryColor,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
  }) : super(key: key);

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
        color: widget.bGColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: _hasError
              ? AppColors.errorColor
              : AppColors.secondaryColor.withOpacity(0.2),
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
                          color: widget.iconColor,
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
                  initialValue: widget.initialValue,
                  validator: !widget.enableValidation
                      ? null
                      : (value) {
                          if (widget.validator == null) {
                            //default validations..
                            if (value == null || value.isEmpty) {
                              setState(() {
                                _hasError = true;
                              });
                              return 'مطلوب';
                            } else {
                              setState(() {
                                _hasError = false;
                              });
                            }
                          } else {
                            final validationError =
                                widget.validator?.call(value);
                            setState(() {
                              _hasError = validationError != null;
                            });
                            return validationError;
                          }
                        },
                  controller: widget.controller,
                  obscureText: widget.obscureText,
                  cursorColor: AppColors.secondaryColor,
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  textInputAction: widget.textInputAction,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 5),
                    hintText: widget.hintText,
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      color: AppColors.secondaryColor.withOpacity(0.5),
                      fontSize: 14.sp,
                    ),
                  ),
                  onSaved: widget.onSaved,
                  textAlign: TextAlign.right,
                  onFieldSubmitted: widget.onFieldSubmitted,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
