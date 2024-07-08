import 'package:boilerplate/themes/widget_themes/appbar_theme.dart';
import 'package:boilerplate/themes/widget_themes/bottom_sheet_theme.dart';
import 'package:boilerplate/themes/widget_themes/checkbox_theme.dart';
import 'package:boilerplate/themes/widget_themes/chip_theme.dart';
import 'package:boilerplate/themes/widget_themes/date_picker_theme.dart';
import 'package:boilerplate/themes/widget_themes/elevated_button_theme.dart';
import 'package:boilerplate/themes/widget_themes/outlined_button_theme.dart';
import 'package:boilerplate/themes/widget_themes/radio_theme.dart';
import 'package:boilerplate/themes/widget_themes/slider_theme.dart';
import 'package:boilerplate/themes/widget_themes/switch_theme.dart';
import 'package:boilerplate/themes/widget_themes/text_button.dart';
import 'package:boilerplate/themes/widget_themes/text_field_theme.dart';
import 'package:boilerplate/themes/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: AppColors.grey,
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    textTheme: AppTextTheme.lightTextTheme,
    chipTheme: MyChipTheme.lightChipTheme,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: MyAppBarTheme.lightAppBarTheme,
    checkboxTheme: MyCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: MyBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: MyElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: MyOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: MyTextFormFieldTheme.lightInputDecorationTheme,
    radioTheme: MyRadioTheme.lightRadioTheme,
    sliderTheme: MySliderTheme.lightSliderTheme,
    textButtonTheme: MyTextButtonTheme.lightTheme,
    switchTheme: MySwitchTheme.lightTheme,
    datePickerTheme: MyDatePickerTheme.lightTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: AppColors.grey,
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    textTheme: AppTextTheme.darkTextTheme,
    chipTheme: MyChipTheme.darkChipTheme,
    scaffoldBackgroundColor: AppColors.black,
    appBarTheme: MyAppBarTheme.darkAppBarTheme,
    checkboxTheme: MyCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: MyBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: MyElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: MyOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: MyTextFormFieldTheme.darkInputDecorationTheme,
    radioTheme: MyRadioTheme.darkRadioTheme,
    sliderTheme: MySliderTheme.darkSliderTheme,
    textButtonTheme: MyTextButtonTheme.darkTheme,
    switchTheme: MySwitchTheme.darkTheme,
    datePickerTheme: MyDatePickerTheme.darkTheme,
  );
}
