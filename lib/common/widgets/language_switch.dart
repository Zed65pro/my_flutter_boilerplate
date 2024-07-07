import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Language {
  final String languageCode;
  final String name;
  final IconData icon;

  Language(this.languageCode, this.name, this.icon);
}

// Add more language here
final List<Language> languages = [
  Language('en', "english", Icons.language),
  Language('ar', "العربية", Icons.flag),
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
        elevation: 16,
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
                Icon(language.icon),
                const SizedBox(width: 8),
                Text(language.name),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
