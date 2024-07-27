import 'package:flutter/material.dart';
import 'package:sadiq/Core/Theme/Colors/app_colors.dart';

class RoundedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final TextStyle? style;
  final Widget? iconWidget;
  const RoundedButton(
      {required this.onPressed,
      required this.title,
      this.iconWidget,
      this.style,
      super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 55,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black
                  .withOpacity(0.25), // Adjust color and opacity as needed
              blurRadius: 13,
              spreadRadius: 4,
              offset: const Offset(0, 4), // You can adjust the offset as needed
            ),
          ],
          gradient: AppColors.appLinearGradient),
      child: Center(
        child: iconWidget == null
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
    );
  }
}
