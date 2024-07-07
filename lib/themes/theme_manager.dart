import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/local_storage.dart';

// Singleton class
class ThemeManager extends ChangeNotifier {
  static final ThemeManager _instance = ThemeManager._internal();

  factory ThemeManager() => _instance;

  ThemeManager._internal() {
    _loadThemeFromPreferences();
  }

  ThemeMode _themeMode = ThemeMode.system;
  final LocalStorage localStorage = LocalStorage();

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

ChangeNotifierProvider wrapTheme(Widget child) {
  return ChangeNotifierProvider<ThemeManager>(
    create: (_) => ThemeManager(),
    child: child,
  );
}
