import 'package:flutter/material.dart';
import '../services/local_storage.dart';

class ThemeManager extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  final LocalStorage localStorage = LocalStorage();

  ThemeManager() {
    _loadThemeFromPreferences();
  }

  ThemeMode get themeMode => _themeMode;

  void toggleTheme(bool isDarkMode) {
    _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    _saveThemeToPreferences();
    notifyListeners();
  }

  void _loadThemeFromPreferences() {
    bool? isDarkMode = localStorage.read<bool>('theme');
    if (isDarkMode != null) {
      _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
      notifyListeners();
    }
  }

  void _saveThemeToPreferences() async {
    bool isDarkMode = _themeMode == ThemeMode.dark ? true : false;
    await localStorage.write<bool>('theme', isDarkMode);
  }
}
