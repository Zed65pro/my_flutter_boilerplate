import 'package:boilerplate/common/widgets/language_switch.dart';
import 'package:boilerplate/routes/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../common/widgets/custom_button.dart';
import '../../../common/widgets/appbar.dart';
import '../../../common/widgets/theme_switch.dart';
import '../../../constants/app_strings.dart';
import '../../../utils/alerts.dart';

final _formKey = GlobalKey<FormState>();
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
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
              CustomButton(
                text: context.tr(AppStrings.nextPage),
                onPressed: () {},
                buttonType: ButtonType.outlined,
                icon: Icons.heart_broken_rounded,
                iconAlignment: IconAlignment.start,
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUnfocus,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          if (value.length < 8 || value.length > 20) {
                            return 'Name must be between 8 and 20 characters long';
                          }

                          return null;
                        },
                        onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
                        decoration: const InputDecoration(
                            label: Text('Username'), hintText: 'Please enter a username between 8-20 words.', border: OutlineInputBorder(), prefixIcon: Icon(Icons.account_circle_sharp)),
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUnfocus,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          if (value.length < 8 || value.length > 20) {
                            return 'Name must be between 8 and 20 characters long';
                          }

                          return null;
                        },
                        onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
                        decoration: const InputDecoration(
                            label: Text('Username'), hintText: 'Please enter a username between 8-20 words.', border: OutlineInputBorder(), prefixIcon: Icon(Icons.account_circle_sharp)),
                      ),
                      const SizedBox(height: 15),
                      CustomButton(
                        text: context.tr("Submit"),
                        onPressed: () {
                          if(!_formKey.currentState!.validate()) return;

                          Alerts.showAlert(context, message: "Form submitted successfuly");
                        },
                        buttonType: ButtonType.filled,
                        icon: Icons.check_circle_outline,
                        iconAlignment: IconAlignment.end,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              FilledButton(
                  onPressed: () async {
                    Navigator.of(context).pushNamed(AppRouter.myForm);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(context.tr(AppStrings.nextPage)),
                  )),
              const SizedBox(height: 15),
              FilledButton(
                  onPressed: () async {
                    Navigator.of(context).pushNamed(AppRouter.counter);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(context.tr(AppStrings.nextPage)),
                  )),
              const SizedBox(height: 15),
              const SizedBox(height: 15),
              FilledButton(
                  onPressed: () => Alerts.showSnackBar(context, message: 'Shit happens Shit happens ', type: AlertType.ERROR),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Snack bar"),
                  )),
              const SizedBox(height: 15),
              FilledButton(
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
