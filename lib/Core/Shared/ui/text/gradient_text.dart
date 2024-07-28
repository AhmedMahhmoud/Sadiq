import 'package:flutter/material.dart';
import 'package:sadiq/Core/Theme/Colors/app_colors.dart';

class GradientText extends StatelessWidget {
  final String label;
  final TextStyle style;
  const GradientText({
    required this.label,
    required this.style,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) {
        return AppColors.appLinearGradient.createShader(
          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
        );
      },
      child: Text(
        label,
        style: style,
      ),
    );
  }
}
