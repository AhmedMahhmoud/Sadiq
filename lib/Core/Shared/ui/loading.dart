import 'package:flutter/cupertino.dart';

import '../../Theme/Colors/app_colors.dart';

class Loading extends StatelessWidget {
  final Color color;
  final double radius;
  const Loading(
      {Key? key, this.color = AppColors.secondaryColor, this.radius = 12})
      : super(key: key);

  @override
  Widget build(BuildContext context) => CupertinoActivityIndicator(
        color: color,
        radius: radius,
      );
}
