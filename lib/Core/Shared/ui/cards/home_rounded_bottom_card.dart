import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeRoundedBottomCard extends StatelessWidget {
  final double height;
  final Widget widget;
  const HomeRoundedBottomCard({
    this.height = 200,
    required this.widget,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(blurRadius: 15, color: Colors.black.withOpacity(0.2))
          ],
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      child: widget,
    );
  }
}
