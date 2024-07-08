import 'package:boilerplate/constants/app_colors.dart';
import 'package:flutter/material.dart';

class MySliderTheme {
  MySliderTheme._();

  static SliderThemeData lightSliderTheme = const SliderThemeData(
    activeTrackColor: AppColors.primary,
    activeTickMarkColor: AppColors.primary,
    thumbColor: AppColors.primary,
    valueIndicatorColor: AppColors.primary,
  );
  static SliderThemeData darkSliderTheme = const SliderThemeData(
    activeTrackColor: AppColors.primary,
    activeTickMarkColor: AppColors.primary,
    thumbColor: AppColors.primary,
    valueIndicatorColor: AppColors.primary,
  );
}
