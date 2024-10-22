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

Future<void> initServices() async {
  await dotenv.load(fileName: ".env"); // Init .env file
  await LanguageManager.initLocalization(); // Init Localization
  await LocalStorage().initGetStorage(); // Init Get Storage
  ConnectivityService().setNavigationKey(NavigationService.navigatorKey); // Initialize Connectivity Service - Monitor internet state
  ApiClient(); // Initialize Api Client
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();

  await ThemeManager().initThemeFromJson();

  runApp(wrapTheme(LanguageManager.wrapLocalization(App())));
}

class App extends StatelessWidget {
  const App({super.key});


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthProvider(),
      child: MaterialApp(
        navigatorKey: NavigationService.navigatorKey,
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
