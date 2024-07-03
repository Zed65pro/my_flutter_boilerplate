import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../services/local_storage.dart';

class LanguageManager {
  static final LanguageManager _instance = LanguageManager._internal();

  factory LanguageManager() {
    return _instance;
  }

  LanguageManager._internal();

  static Locale currentLanguage(BuildContext context) => EasyLocalization.of(context)!.currentLocale!;

  static void setLanguage(BuildContext context, String language) {
    final LocalStorage localStorage = LocalStorage();
    localStorage.write('language', language);
    EasyLocalization.of(context)!.setLocale(Locale(language));
  }

  static void getStoredLanguage(context) {
    final LocalStorage localStorage = LocalStorage();
    final String? language = localStorage.read('language');

    if (language != null) {
      Locale locale = Locale(language);
      EasyLocalization.of(context)!.setLocale(locale);
    }
  }
}
