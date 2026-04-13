
import 'package:ecommerce_app/core/Styling/app_colors.dart';
import 'package:ecommerce_app/core/Styling/app_fonts.dart';
import 'package:ecommerce_app/core/Styling/app_styles.dart';
import 'package:flutter/material.dart';

class ThemeDataStyle {
  static final lightTheme = ThemeData(
    primaryColor: AppColors.mainPrimaryColor,
    scaffoldBackgroundColor: AppColors.whiteColor,
    fontFamily: AppFonts.mainFontName,
    textTheme: TextTheme(
      titleLarge: AppStyles.primaryHeadLineStyle,
      titleMedium: AppStyles.subTitleStyles,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.mainPrimaryColor,
      disabledColor: AppColors.mainSecanderyColor,
    ),
  );
}
