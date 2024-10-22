import 'package:boilerplate/features/home/views/orders_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../error/error_route.dart';
import '../features/auth/views/login.dart';
import '../features/counter/controllers/counter_controller.dart';
import '../features/counter/views/counter_view.dart';
import '../features/example.form/views/form_view.dart';
import '../features/home/views/home_view.dart';
import '../features/splash/views/splash_screen.dart';

Widget withProvider<T extends ChangeNotifier>(Widget page, T Function() createNotifier) {
  return ChangeNotifierProvider(
    create: (_) => createNotifier(),
    child: page,
  );
}

class AppRouter {
  AppRouter._();

  static const String homeScreen = '/home-screen';
  static const String counter = '/counter';
  static const String myForm = '/my-form';
  static const String onboarding = '/onboarding';
  static const String splashScreen = '/splash-screen';
  static const String loginScreen = '/login-screen';
  static const String ordersScreen = '/orders-screen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return _buildPageRoute(const SplashScreen(), settings);
      case homeScreen:
        return _buildPageRoute(const HomeView(), settings);
      case loginScreen:
        return _buildPageRoute(const LoginScreen(), settings);
      case ordersScreen:
        return _buildPageRoute(const OrdersPage(), settings);
      case counter:
        return _buildPageRoute(withProvider(const CounterView(), () => CounterController()), settings);
      case myForm:
        return _buildPageRoute(const MyFormView(), settings);
      default:
        return _buildPageRoute(const ErrorRoute(), settings);
    }
  }

  static PageRouteBuilder<dynamic> _buildPageRoute(Widget child, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}
