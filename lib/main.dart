import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Core/AppProviders/bloc_providers.dart';
import 'Core/Theme/appTheme/apptheme.dart';
import 'Features/Splash/View/Screen/splash_screen.dart';
import 'Routes/app_routes.dart';
import 'Core/DependencyInj/dep_inj.dart' as di;

GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.setupDependencies();
  await ScreenUtil.ensureScreenSize();
  await EasyLocalization.ensureInitialized();

  runApp(DevicePreview(
    enabled: false,
    builder: (context) {
      return EasyLocalization(
        supportedLocales: const [Locale('ar')],
        path: 'assets/translations',
        fallbackLocale: const Locale('ar'),
        startLocale: const Locale('ar'),
        child: const MyApp(),
      );
    },
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
          child: appProviders(
            MaterialApp(
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              localizationsDelegates: context.localizationDelegates,
              onGenerateRoute: AppRouter.generateRoute,
              home: const SplashScreen(),
              navigatorKey: navKey,
              debugShowCheckedModeBanner: false,
              theme: AppTheme.appTheme,
            ),
          ),
        ),
      ),
    );
  }
}
