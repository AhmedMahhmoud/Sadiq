import 'package:flutter/material.dart';
import 'package:sadiq/Features/Home/View/MyOrders/View/Screens/change_order_status.dart';

import '../Features/Authentication/Presentation/screen/sign_in.dart';
import '../Features/Authentication/Presentation/screen/sign_up.dart';
import '../Features/Authentication/Presentation/screen/success.dart';
import '../Features/Home/View/Screen/home.dart';
import '../Features/Notification/View/Screen/notification.dart';
import '../Features/Earnings/screen/earnings.dart';
import '../Features/Policy/screen/policy.dart';
import '../Features/Profile/View/Screen/profile.dart';
import '../Features/Profile/View/Screen/profile_details.dart';
import '../Features/Profile/View/Screen/subscription.dart';
import '../Features/TermsAndCondictions/screen/terms_conditions.dart';
import '../Features/Setting/View/Screen/setting.dart';
import '../Features/Splash/View/Screen/splash_screen.dart';
import '../Features/support/View/Screens/support.dart';
import 'routes.dart';

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
      case AppRoutes.support:
        return _createRoute(const SupportScreen());
      case AppRoutes.profile:
        return _createRoute(const ProfileScreen());
      case AppRoutes.profileDetails:
        return _createRoute(const ProfileDetailsScreen());
      case AppRoutes.subscription:
        return _createRoute(const SubscriptionScreen());
      case AppRoutes.termsConditionsScreen:
        return _createRoute(const TermsConditionsScreen());
      case AppRoutes.policyScreen:
        return _createRoute(const PolicyScreen());
      case AppRoutes.earningsScreen:
        return _createRoute(const EarningsScreen());
      case AppRoutes.changeOrderStatus:
        return _createRoute(const ChangeOrderStatus());
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
