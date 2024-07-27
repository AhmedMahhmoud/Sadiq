import 'package:flutter/material.dart';

import '../../../../Core/Theme/Colors/app_colors.dart';
import '../widgets/choose_city_step.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundOfWhite,
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: ChooseCityStep(),
      ),
    );
  }
}
