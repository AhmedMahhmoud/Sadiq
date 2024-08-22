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
  final bool isEnabled;
  const RoundedButton({
    required this.onPressed,
    required this.title,
    this.iconWidget,
    this.navigationArrowEnabled = false,
    this.style,
    this.btnColor,
    this.isEnabled = true,
    this.width = 350,
    this.height = 50,
    this.btnSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: !isEnabled ? 0.5 : 1,
      child: Container(
        width: btnSize?.width ?? width,
        height: btnSize?.height ?? height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: btnColor == null ? AppColors.appLinearGradient : null,
          color: btnColor,
          boxShadow: isEnabled == false
              ? []
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 13,
                    spreadRadius: 4,
                    offset: const Offset(0, 4),
                  ),
                ],
        ),
        child: MaterialButton(
          onPressed: isEnabled ? onPressed : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
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
                    ? Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(title,
                            textAlign: TextAlign.center, style: style),
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          iconWidget!,
                          SizedBox(
                            width: width! == 112 ? 5 : 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Text(title,
                                textAlign: TextAlign.center, style: style),
                          ),
                        ],
                      ),
          ),
        ),
      ),
    );
  }
}
