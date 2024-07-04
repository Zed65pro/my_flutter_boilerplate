import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart' show Locale;

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
}
