import 'package:boilerplate/constants/asset_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Language {
  final String languageCode;
  final String name;
  final String asset;

  Language(this.languageCode, this.name, this.asset);
}

// Add more languages here
final List<Language> languages = [
  Language('en', "English", AppAssets.english),
  Language('ar', "العربية", AppAssets.arabic),
];

class LanguageSwitcher extends StatelessWidget {
  const LanguageSwitcher({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String selectedLanguage = context.locale.languageCode;
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: selectedLanguage,
        icon: const Icon(Icons.arrow_drop_down),
        iconSize: 24,
        elevation: 6,
        onChanged: (newVal) {
          if (newVal != null) {
            context.setLocale(Locale(newVal));
          }
        },
        items: languages.map<DropdownMenuItem<String>>((Language language) {
          return DropdownMenuItem<String>(
            value: language.languageCode,
            child: Row(
              children: [
                Image.asset(
                  language.asset,
                  width: 24,
                  height: 24,
                  // You can adjust width and height as needed
                ),
                const SizedBox(width: 2),
                Text(language.name),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
