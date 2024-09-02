import 'package:boilerplate/features/splash/views/splash_screen.dart';
import 'package:boilerplate/services/language_manager.dart';
import 'package:boilerplate/routes/routes.dart';
import 'package:boilerplate/services/api_client.dart';
import 'package:boilerplate/services/connectivity.dart';
import 'package:boilerplate/services/local_storage.dart';
import 'package:boilerplate/services/navigation_service.dart';
import 'package:boilerplate/services/theme_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'constants/app_strings.dart';
import 'features/auth/controllers/login_controller.dart';

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

  // Check if first time entered app
  final onBoardingDone = await LocalStorage().read(AppStrings.onBoardingDone) ?? false;

  await ThemeManager().initThemeFromJson();

  runApp(wrapTheme(LanguageManager.wrapLocalization(App(onBoardingDone: onBoardingDone))));
}

class App extends StatelessWidget {
  const App({super.key, required this.onBoardingDone});

  final bool onBoardingDone;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthProvider(),
      child: MaterialApp(
        navigatorKey: navigatorKey,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: AppStrings.appName,
        themeMode: Provider.of<ThemeManager>(context).themeMode,
        theme: ThemeManager().lightTheme,
        darkTheme: ThemeManager().darkTheme,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.generateRoute,
        home: const SplashScreen(),
      ),
    );
  }
}
