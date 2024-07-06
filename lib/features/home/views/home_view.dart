import 'package:boilerplate/services/navigation_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../common/widgets/custom_switch_theme.dart';
import '../../../logging/logger.dart';
import '../../counter/views/counter_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
          actions: const [
            CustomIconSwitch(),
          ],
        ),
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
                    AppLogger.info(NavigationService.context.locale.languageCode);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Switch Language"),
                  )),
              ElevatedButton(
                  onPressed: () async {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const CounterView()),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Next page"),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
