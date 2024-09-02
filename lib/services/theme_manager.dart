import 'dart:convert';

import 'package:boilerplate/utils/device_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_theme_plus/json_theme_plus.dart';
import 'package:provider/provider.dart';
import 'local_storage.dart';

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

  ThemeData? lightTheme;
  ThemeData? darkTheme;

  // Function used to toggle the theme of the application
  void toggleTheme(bool isDarkMode) {
    _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    _saveThemeToPreferences();
    notifyListeners();
  }

  // Initialized in main function
  initThemeFromJson() async {
    // Light theme
    final themeStr = await rootBundle.loadString("assets/theme/appainter_theme_light.json");
    final themeJson = jsonDecode(themeStr);
    lightTheme = ThemeDecoder.decodeThemeData(themeJson)!;

    // Dark theme
    final themeStrDark = await rootBundle.loadString("assets/theme/appainter_theme_dark.json");
    final themeJsonDark = jsonDecode(themeStrDark);
    darkTheme = ThemeDecoder.decodeThemeData(themeJsonDark)!;
  }

  // Checks current theme from storage if user changed it manually, otherwise checks from device theme
  void _loadThemeFromPreferences() {
    bool? isDarkMode = localStorage.read<bool>('theme');
    if (isDarkMode != null) {
      _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
      notifyListeners();
    } else {
      // Necessary for initial boot as _ThemeMode is set to ThemeMode.system
      final bool isSystemDark = DeviceUtils.currentDeviceBrightness == Brightness.dark;
      _themeMode = isSystemDark ? ThemeMode.dark : ThemeMode.light;
    }
  }

  // Saves current theme to storage when user toggles it manually
  void _saveThemeToPreferences() async {
    bool isDarkMode = _themeMode == ThemeMode.dark ? true : false;
    await localStorage.write<bool>('theme', isDarkMode);
  }
}

// Theme Wrapper for material App only used in main.dart
ChangeNotifierProvider wrapTheme(Widget child) {
  return ChangeNotifierProvider<ThemeManager>(
    create: (_) => ThemeManager(),
    child: child,
  );
}
