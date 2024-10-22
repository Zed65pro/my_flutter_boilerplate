import 'package:boilerplate/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../auth/controllers/login_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Check authentication after the animation completes
    Provider.of<AuthProvider>(context, listen: false).checkAuthentication().then((_) {
      if (!mounted) return;

      final isAuthenticated = Provider.of<AuthProvider>(context, listen: false).isAuthenticated;
      if (isAuthenticated) {
        Navigator.of(context).popAndPushNamed(AppRouter.homeScreen);
      } else {
        Navigator.of(context).popAndPushNamed(AppRouter.loginScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
