import 'package:boilerplate/services/navigation_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart' show BuildContext, Locale;

class LanguageManager {
  LanguageManager._();

  static Future<void> initLocalization() async {
    await EasyLocalization.ensureInitialized();
    EasyLocalization.logger.enableBuildModes = []; // Disable EasyLocalization Logging - comment this line to enable
  }

  static EasyLocalization wrapLocalization(final app) {
    return EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'lib/localization/translations',
      fallbackLocale: const Locale('en'),
      child: app,
    );
  }

  static void switchLanguage() {
    final BuildContext context = NavigationService.context;
    final String currentLanguage = context.locale.languageCode;
    final String switchLanguage = currentLanguage == 'en' ? 'ar' : 'en';
    context.setLocale(Locale(switchLanguage));
  }
}
