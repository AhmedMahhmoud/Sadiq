import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/AppProviders/bloc_providers.dart';
import 'package:sadiq/Core/Theme/appTheme/apptheme.dart';
import 'package:sadiq/Features/MyVechile/View/my_vechile_screen.dart';
import 'package:sadiq/Features/Splash/View/Screen/splash_screen.dart';
import 'package:sadiq/Routes/app_routes.dart';
import 'package:sadiq/Routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 436),
      child: appProviders(
        SafeArea(
          child: MaterialApp(
            onGenerateRoute: AppRouter.generateRoute,
            initialRoute: AppRoutes.signup,
            home: MyVechileScreen(),
            debugShowCheckedModeBanner: false,
            theme: AppTheme.appTheme,
          ),
        ),
      ),
    );
  }
}
