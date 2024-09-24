// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/Paths/image_paths.dart';
import 'package:sadiq/Core/Shared/ui/images/app_logo_with_title.dart';
import 'package:sadiq/Core/Shared/ui/images/png_display.dart';
import 'package:sadiq/Core/Theme/Colors/app_colors.dart';
import 'package:sadiq/Core/Theme/text/text_style.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Authentication/Presentation/cubit/auth_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () async {
      /*SharedPreferences pref = await SharedPreferences.getInstance();
      if (pref.getBool('rememberMe') != null &&
          pref.getBool('rememberMe')! &&
          pref.getString('loginData') != null) {
        final loginData = json.decode(pref.getString('loginData')!);
        final authCubit = context.read<AuthCubit>();
        await authCubit.signin(
          email: loginData['email'],
          password: loginData['password'],
        );
      } else {*/
      Navigator.popAndPushNamed(context, '/signin');
      //}
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: authenticationBlocListener,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.backgroundOfWhite,
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(children: [
                SizedBox(
                  height: 60.h,
                ),
                const DisplayAppTitleWithLogo(),
                SizedBox(
                  height: 30.h,
                ),
                Text('مرحبا بك في',
                    style: AppTextStyle.title3
                        .copyWith(color: AppColors.secondaryColor)),
                Text(
                  "تطبيق المندوب",
                  style: AppTextStyle.title3
                      .copyWith(color: AppColors.primaryColor),
                ),
              ]),
              PngDisplay(
                path: PngAssetsPaths.buildingBG1,
                size: Size(MediaQuery.sizeOf(context).width, 300),
              )
            ],
          ),
        );
      },
    );
  }

  void authenticationBlocListener(BuildContext context, AuthState state) {
    if (state is AuthLoginSuccessState) {
      Navigator.popAndPushNamed(context, '/home');
    } else if (state is AuthLoginErrorState) {
      Navigator.popAndPushNamed(context, '/signin');
    }
  }
}
