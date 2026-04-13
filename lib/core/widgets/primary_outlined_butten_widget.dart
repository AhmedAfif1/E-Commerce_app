import 'package:ecommerce_app/core/Styling/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryOutlinButtonWidget extends StatelessWidget {
  final double? width;
  final double? borderRaduis;
  final double? height;
  final Color? bordersColors;
  final Color? textColor;
  final String? buttenText;
  final double? fontSize;
  final void Function()? onPrese;
  const PrimaryOutlinButtonWidget({
    this.width,
    this.fontSize,
    this.borderRaduis,
    this.height,
    this.bordersColors,
    this.buttenText,
    this.onPrese,
    this.textColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPrese,
      style: ElevatedButton.styleFrom(
        //   backgroundColor: buttenColor ?? AppColors.mainPrimaryColor,
        side: BorderSide(
          color: bordersColors ?? AppColors.mainPrimaryColor,
          width: 1.w,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRaduis ?? 8.r),
        ),
        fixedSize: Size(width ?? 331.w, height ?? 56.h),
      ),
      child: Text(
        buttenText ?? '',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: textColor ?? AppColors.mainPrimaryColor,
          fontSize: fontSize ?? 16.sp,
        ),
      ),
    );
  }
}
