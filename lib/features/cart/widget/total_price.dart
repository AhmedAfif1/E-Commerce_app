import 'package:ecommerce_app/core/Styling/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TotalPrice extends StatelessWidget {
  final String title;
  final String price;
  const TotalPrice({required this.price, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          Text(title, style: AppStyles.black15BoldStyle),
          Spacer(),
          Text(
            price,
            style: AppStyles.grey12w500.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
          ),
        ],
      ),
    );
  }
}
