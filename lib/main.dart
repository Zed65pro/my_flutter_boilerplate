import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'app.dart';

void main() {
  runApp(EasyLocalization(
      supportedLocales: [const Locale('en'), const Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: const App()
  ),);
}