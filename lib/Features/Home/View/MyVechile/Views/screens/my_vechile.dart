import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/Shared/ui/cards/home_rounded_bottom_card.dart';
import '../widgets/display_vechile.dart';

class MyVechile extends StatelessWidget {
  const MyVechile({super.key});

  @override
  Widget build(BuildContext context) {
    return  HomeRoundedBottomCard(
      widget: Column(
        children: [
          DisplayVechile(),
          SizedBox(height: 20.h,),

        ],
      ),
    );
  }
}
