import 'package:flutter/material.dart';
import 'package:sadiq/Features/Authentication/View/screen/sign_in.dart';
import 'package:sadiq/Features/Authentication/View/screen/sign_up.dart';
import 'package:sadiq/Features/Authentication/View/screen/success.dart';
import 'package:sadiq/Features/Home/View/Screen/home.dart';
import 'package:sadiq/Features/Setting/View/Screen/setting.dart';
import 'package:sadiq/Features/Splash/View/Screen/splash_screen.dart';
import 'package:sadiq/Routes/routes.dart';

import '../Features/Notification/View/Screen/notification.dart';

class AppRouter {
  static PageRouteBuilder<dynamic> _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return _createRoute(const SplashScreen());
      case AppRoutes.login:
        return _createRoute(const SignInScreen());
      case AppRoutes.home:
        return _createRoute(const HomeScreen());
      case AppRoutes.signup:
        return _createRoute(const SignUpScreen());
      case AppRoutes.success:
        return _createRoute(const SuccessScreen());
      case AppRoutes.setting:
        return _createRoute(const SettingScreen());
      case AppRoutes.notification:
        return _createRoute(const NotificationScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
