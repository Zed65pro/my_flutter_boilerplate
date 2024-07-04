import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'logging/logger.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Center(
                child: Text(
                  "welcome".tr(),
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    final String currentLanguage = context.locale.languageCode;
                    final String switchLanguage = currentLanguage == 'en' ? 'ar' : 'en';
                    context.setLocale(Locale(switchLanguage));
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Switch Language"),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
