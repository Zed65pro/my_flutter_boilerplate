import 'package:boilerplate/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'constants/app_strings.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppStrings.appName,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      // initialBinding: GeneralBindings(),
      home: const Scaffold(
        body: Center(
          child: Text(
            'Awesome! 🎊 Project Structure is set up and running. \n Happy T Coding 🎊',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
