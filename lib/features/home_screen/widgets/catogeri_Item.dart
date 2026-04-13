import 'package:ecommerce_app/core/Styling/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CatogeriItem extends StatelessWidget {
  final String catogeryName;
  const CatogeriItem({required this.catogeryName, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 8.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1.w),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Text(catogeryName, style: AppStyles.black15BoldStyle),
      ),
    );
  }
}
