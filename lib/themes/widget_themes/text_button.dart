import 'package:boilerplate/constants/app_colors.dart';
import 'package:flutter/material.dart';

class MyTextButtonTheme {
  MyTextButtonTheme._();

  static TextButtonThemeData lightTheme = const TextButtonThemeData(
      style: ButtonStyle(
    iconColor: WidgetStatePropertyAll(AppColors.darkGrey),
    foregroundColor: WidgetStatePropertyAll(AppColors.black),
  ));
  static TextButtonThemeData darkTheme = const TextButtonThemeData(
      style: ButtonStyle(
    iconColor: WidgetStatePropertyAll(AppColors.darkGrey),
    foregroundColor: WidgetStatePropertyAll(AppColors.white),
  ));
}
