import 'package:ecommerce_app/core/Styling/app_colors.dart';
import 'package:ecommerce_app/core/widgets/spacing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButtonWidget extends StatelessWidget {
  final double? width;
  final double? borderRaduis;
  final double? height;
  final Color? buttenColor;
  final Color? textColor;
  final String? buttenText;
  final double? fontSize;
  final void Function()? onPrese;
  final Widget? icon;
  final Widget? tralingIcon;

  const PrimaryButtonWidget({
    this.width,
    this.tralingIcon,
    this.icon,
    this.fontSize,
    this.borderRaduis,
    this.height,
    this.buttenColor,
    this.buttenText,
    this.onPrese,
    this.textColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPrese,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttenColor ?? AppColors.mainPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRaduis ?? 8.r),
        ),
        fixedSize: Size(width ?? 331.w, height ?? 56.h),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon != null ? icon! : SizedBox.shrink(),
          icon != null ? WidthSpacing(8) : SizedBox.shrink(),
          Text(
            buttenText ?? '',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: textColor ?? Colors.white,
              fontSize: fontSize ?? 16.sp,
            ),
          ),
          tralingIcon != null ? WidthSpacing(8) : SizedBox.shrink(),
          tralingIcon != null ? tralingIcon! : SizedBox.shrink(),
        ],
      ),
    );
  }
}
