import 'package:boilerplate/constants/asset_strings.dart';
import 'package:boilerplate/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../auth/controllers/login_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      animationBehavior: AnimationBehavior.preserve,
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.slowMiddle,
    );

    _controller.forward();

    // Check authentication after the animation completes
    Provider.of<AuthProvider>(context, listen: false).checkAuthentication().then((_) {
      if (!mounted) return;

      final isAuthenticated = Provider.of<AuthProvider>(context, listen: false).isAuthenticated;
      if (isAuthenticated) {
        Navigator.of(context).popAndPushNamed(AppRouter.homeScreen);
      } else {
        Navigator.of(context).popAndPushNamed(AppRouter.homeScreen);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: ScaleTransition(
            scale: _animation,
            child: Image.asset(AppAssets.arabic), // Your logo here
          ),
        ),
      ),
    );
  }
}
