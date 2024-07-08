import 'package:boilerplate/localization/language_manager.dart';
import 'package:boilerplate/routes/routes.dart';
import 'package:boilerplate/services/api_client.dart';
import 'package:boilerplate/services/connectivity.dart';
import 'package:boilerplate/services/local_storage.dart';
import 'package:boilerplate/services/navigation_service.dart';
import 'package:boilerplate/themes/theme.dart';
import 'package:boilerplate/themes/theme_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'constants/app_strings.dart';

// Navigation key for context
final navigatorKey = GlobalKey<NavigatorState>();

Future<void> initServices() async {
  await dotenv.load(fileName: ".env"); // Init .env file
  await LanguageManager.initLocalization(); // Init Localization
  await LocalStorage().initGetStorage(); // Init Get Storage
  ConnectivityService().setNavigationKey(navigatorKey); // Initialize Connectivity Service - Monitor internet state
  NavigationService.navigatorKey = navigatorKey; // Navigation service saves the navigation key, so that context can be accessed easily from anywhere in the project
  ApiClient(); // Initialize Api Client
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(wrapTheme(LanguageManager.wrapLocalization(const App())));
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
      themeMode: Provider.of<ThemeManager>(context).themeMode,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: AppRouter.home,
    );
  }
}
