import 'package:boilerplate/common/widgets/language_switch.dart';
import 'package:boilerplate/routes/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../common/widgets/appbar.dart';
import '../../../common/widgets/theme_switch.dart';
import '../../../constants/app_strings.dart';
import '../../../utils/alerts.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(),
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
                  AppStrings.welcome.tr(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                  onPressed: () async {
                    Navigator.of(context).pushNamed(AppRouter.myForm);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(context.tr(AppStrings.nextPage)),
                  )),
              const SizedBox(height: 15),
              ElevatedButton(
                  onPressed: () async {
                    Navigator.of(context).pushNamed(AppRouter.counter);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(context.tr(AppStrings.nextPage)),
                  )),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () async {
                  Navigator.of(context).pushNamed(AppRouter.onboarding);
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("On boarding"),
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                  onPressed: () => Alerts.showSnackBar(context, message: 'Shit happens Shit happens ', type: AlertType.NORMAL),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("snack bar"),
                  )),
              const SizedBox(height: 15),
              ElevatedButton(
                  onPressed: () => Alerts.showAlert(context, title: 'sadsa', message: 'Shit happens Shit happens ', type: AlertType.NORMAL),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("dialog 1"),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
