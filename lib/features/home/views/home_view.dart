import 'package:boilerplate/common/widgets/language_switch.dart';
import 'package:boilerplate/routes/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../common/widgets/appbar.dart';
import '../../../common/widgets/theme_switch.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: "welcome".tr()),
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 40),
              const ThemeSwitch(),
              const SizedBox(height: 15),
              const LanguageSwitcher(),
              const SizedBox(height: 15),
              Center(
                child: Text(
                  "welcome".tr(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                  onPressed: () async {
                    Navigator.of(context).pushNamed(AppRouter.counter);
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
