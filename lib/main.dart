import 'package:boilerplate/localization/language_manager.dart';
import 'package:boilerplate/services/connectivity.dart';
import 'package:boilerplate/services/navigation_service.dart';
import 'package:boilerplate/themes/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'constants/app_strings.dart';
import 'home_page.dart';

// Navigation key for context
final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LanguageManager.initLocalization();

  // Initialize Connectivity Service - Monitor internet state
  ConnectivityService(navigatorKey);

  // Navigation service saves the navigation key, so that context can be accessed easily from anywhere in the project
  NavigationService.navigatorKey = navigatorKey;

  runApp(LanguageManager.wrapLocalization(const App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: navigatorKey,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: AppStrings.appName,
        themeMode: ThemeMode.system,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        home: const HomePage());
  }
}
