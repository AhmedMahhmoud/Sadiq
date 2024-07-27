import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/AppProviders/bloc_providers.dart';
import 'package:sadiq/Core/Theme/appTheme/apptheme.dart';
import 'package:sadiq/Features/Home/View/Screen/home.dart';
import 'package:sadiq/Routes/app_routes.dart';
import 'package:sadiq/Routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    supportedLocales: [ Locale('ar')],
    path: 'assets/translations',
    fallbackLocale: const Locale('ar'),
    startLocale: const Locale('ar'),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 436),
      builder: (context, child) => appProviders(
        SafeArea(
          child: MaterialApp(
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            localizationsDelegates: context.localizationDelegates,
            onGenerateRoute: AppRouter.generateRoute,
            initialRoute: AppRoutes.home,
            home: const HomeScreen(),
            debugShowCheckedModeBanner: false,
            theme: AppTheme.appTheme,
          ),
        ),
      ),
    );
  }
}
