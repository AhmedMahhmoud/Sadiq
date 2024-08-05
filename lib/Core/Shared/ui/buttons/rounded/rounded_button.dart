import 'package:flutter/material.dart';
import 'package:sadiq/Core/Theme/Colors/app_colors.dart';

class RoundedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final TextStyle? style;
  final Widget? iconWidget;
  final Color? btnColor;
  final double? width;
  final double? height;
  final Size? btnSize;
  final bool navigationArrowEnabled;
  const RoundedButton(
      {required this.onPressed,
      required this.title,
      this.iconWidget,
      this.navigationArrowEnabled = false,
      this.style,
      this.btnColor,
      this.width = 350,
      this.height = 55,
      this.btnSize,
      super.key});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 13,
              spreadRadius: 4,
              offset: const Offset(0, 4),
            ),
          ],
          gradient: btnColor == null ? AppColors.appLinearGradient : null,
          color: btnColor,
        ),
        child: Center(
          child: navigationArrowEnabled
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(title, textAlign: TextAlign.center, style: style),
                    const Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.white,
                    ),
                  ],
                )
              : iconWidget == null
                  ? Text(title, textAlign: TextAlign.center, style: style)
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        iconWidget!,
                        const SizedBox(
                          width: 10,
                        ),
                        Text(title, textAlign: TextAlign.center, style: style),
                      ],
                    ),
        ),
      ),
    );
  }
}
