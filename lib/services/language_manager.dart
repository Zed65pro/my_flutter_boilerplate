import 'package:boilerplate/services/navigation_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart' show BuildContext, Locale;

class LanguageManager {
  LanguageManager._();

  // Inits easy location and disabled default logger
  static Future<void> initLocalization() async {
    await EasyLocalization.ensureInitialized();
    EasyLocalization.logger.enableBuildModes = []; // Disable EasyLocalization Logging - comment this line to enable
  }

  // Wraps the app with easy localization and returns the wrapped app - used in main.dart around materialapp only
  static EasyLocalization wrapLocalization(final app) {
    return EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: app,
    );
  }

  // Toggles language - currently supports 2 languages - can minimally refactor later to include multiple languages by passing language code to switch language
  static void switchLanguage() {
    final BuildContext context = NavigationService.context;
    final String currentLanguage = context.locale.languageCode;
    final String switchLanguage = currentLanguage == 'en' ? 'ar' : 'en';
    context.setLocale(Locale(switchLanguage));
  }
}
