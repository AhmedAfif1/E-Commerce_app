
import 'package:ecommerce_app/core/Styling/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFiled extends StatelessWidget {
  final String? hintText;
  final Widget? suffix;
  final double? width;
  final bool? isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  const CustomTextFiled({
    this.isPassword,
    this.controller,
    this.validator,
    this.width,
    this.hintText,
    this.suffix,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 331.w,
      child: TextFormField(
        controller: controller,
        validator: validator,
        obscureText: isPassword ?? false,
        cursorColor: AppColors.mainPrimaryColor,
        autofocus: false,
        decoration: InputDecoration(
          hintText: hintText ?? '',
          hintStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 15,
            color: Color(0xff8391A1),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 18.w,
            vertical: 18.h,
          ),
          // isDense: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: Color(0xffF7F8F9), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: AppColors.mainPrimaryColor, width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: Colors.red, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: Colors.red, width: 1),
          ),
          filled: true,
          fillColor: Color(0xffE8ECF4),
          suffix: suffix,
        ),
      ),
    );
  }
}
