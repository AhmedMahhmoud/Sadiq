import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadiq/Core/AppProviders/bloc_providers.dart';
import 'package:sadiq/Core/Theme/appTheme/apptheme.dart';
import 'package:sadiq/Features/Authentication/View/screen/sign_in.dart';

import 'package:sadiq/Routes/app_routes.dart';

GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('ar'),
      startLocale: const Locale('ar'),
      child: const MyApp(),
    ),
  );
  runApp(EasyLocalization(
    supportedLocales: const [Locale('ar')],
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
            home: SignInScreen(),
            navigatorKey: navKey,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.appTheme,
          ),
        ),
      ),
    );
  }
}
