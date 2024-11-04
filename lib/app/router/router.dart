// ignore_for_file: sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:machine_test/app/router/router_constants.dart';
import 'package:machine_test/src/presentation/view/auth/login_screen/login_screen.dart';
import 'package:machine_test/src/presentation/view/auth/splash_screen/splash_screen.dart';
import 'package:machine_test/src/presentation/view/home/home_screen/home_screen.dart';
import 'package:machine_test/src/presentation/view/home/register_screen/register_screen.dart';

enum PageRouteAnimation { fade, scale, rotate, slide, slideBottomTop }

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterConstants.splashRoute:
        return buildPageRoute(const SplashScreen(), PageRouteAnimation.slide);

      case RouterConstants.loginRoute:
        return buildPageRoute(const LoginScreen(), PageRouteAnimation.fade);

      case RouterConstants.homeRoute:
        return buildPageRoute(const HomeScreen(), PageRouteAnimation.slide);

      case RouterConstants.registerRoute:
        return buildPageRoute(const RegisterScreen(), PageRouteAnimation.slideBottomTop);
      default:
        return MaterialPageRoute<Scaffold>(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }

  static Route<T> buildPageRoute<T>(
    Widget? child,
    PageRouteAnimation? pageRouteAnimation,
  ) {
    if (pageRouteAnimation != null) {
      if (pageRouteAnimation == PageRouteAnimation.fade) {
        return PageRouteBuilder(
          pageBuilder: (c, a1, a2) => child!,
          transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
          transitionDuration: const Duration(milliseconds: 1000),
        );
      } else if (pageRouteAnimation == PageRouteAnimation.rotate) {
        return PageRouteBuilder(
          pageBuilder: (c, a1, a2) => child!,
          transitionsBuilder: (c, anim, a2, child) => RotationTransition(child: child, turns: ReverseAnimation(anim)),
          transitionDuration: const Duration(milliseconds: 700),
        );
      } else if (pageRouteAnimation == PageRouteAnimation.scale) {
        return PageRouteBuilder(
          pageBuilder: (c, a1, a2) => child!,
          transitionsBuilder: (c, anim, a2, child) => ScaleTransition(child: child, scale: anim),
          transitionDuration: const Duration(milliseconds: 700),
        );
      } else if (pageRouteAnimation == PageRouteAnimation.slide) {
        return PageRouteBuilder(
          pageBuilder: (c, a1, a2) => child!,
          transitionsBuilder: (c, anim, a2, child) => SlideTransition(
            child: child,
            position: Tween(begin: const Offset(1.0, 0.0), end: const Offset(0.0, 0.0)).animate(anim),
          ),
          transitionDuration: const Duration(milliseconds: 450),
        );
      } else if (pageRouteAnimation == PageRouteAnimation.slideBottomTop) {
        return PageRouteBuilder(
          pageBuilder: (c, a1, a2) => child!,
          transitionsBuilder: (c, anim, a2, child) => SlideTransition(
            child: child,
            position: Tween(begin: const Offset(0.0, 1.0), end: const Offset(0.0, 0.0)).animate(anim),
          ),
          transitionDuration: const Duration(milliseconds: 350),
        );
      }
    }
    return MaterialPageRoute<T>(builder: (_) => child!);
  }
}
