import 'package:ecommerce_app/core/Styling/app_colors.dart';
import 'package:ecommerce_app/core/Styling/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyles {
  static TextStyle primaryHeadLineStyle = TextStyle(
    color: AppColors.blackColor,
    fontFamily: AppFonts.mainFontName,
    fontWeight: FontWeight.w600,
    fontSize: 32.sp,
  );

  static TextStyle subTitleStyles = TextStyle(
    color: AppColors.mainSecanderyColor,
    fontFamily: AppFonts.mainFontName,
    fontWeight: FontWeight.w500,
    fontSize: 16.sp,
  );
  static TextStyle black16w600 = TextStyle(
    color: AppColors.blackColor,
    fontFamily: AppFonts.mainFontName,
    fontWeight: FontWeight.w600,
    fontSize: 16.sp,
  );
  static TextStyle grey12w500 = TextStyle(
    color: AppColors.greyColor,
    fontWeight: FontWeight.w500,
    fontSize: 12.sp,
  );
  static TextStyle black15BoldStyle = TextStyle(
    fontFamily: AppFonts.mainFontName,
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 15.sp,
  );

  static TextStyle black18BoldStyle = TextStyle(
    fontFamily: AppFonts.mainFontName,
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 18.sp,
  );
}
