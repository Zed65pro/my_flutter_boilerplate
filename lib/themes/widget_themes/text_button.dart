import 'package:boilerplate/constants/app_colors.dart';
import 'package:flutter/material.dart';

class MyTextButtonTheme {
  MyTextButtonTheme._();

  static TextButtonThemeData lightTheme = TextButtonThemeData(
      style: ButtonStyle(
    backgroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.hovered)) {
        return AppColors.accent;
      }
      return AppColors.primary;
    }),
    iconColor: const WidgetStatePropertyAll(AppColors.darkGrey),
    foregroundColor: const WidgetStatePropertyAll(AppColors.black),
  ));

  static TextButtonThemeData darkTheme = TextButtonThemeData(
      style: ButtonStyle(
    backgroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.hovered)) {
        return AppColors.accent;
      }
      return AppColors.primary;
    }),
    iconColor: const WidgetStatePropertyAll(AppColors.darkGrey),
    foregroundColor: const WidgetStatePropertyAll(AppColors.white),
  ));
}
