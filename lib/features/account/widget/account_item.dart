import 'package:ecommerce_app/core/Styling/app_assets.dart';
import 'package:ecommerce_app/core/Styling/app_styles.dart';
import 'package:ecommerce_app/core/widgets/spacing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountItem extends StatelessWidget {
  final String? title;
  final String? iconPath;
  final Function()? onTap;
  const AccountItem({this.title, this.onTap, this.iconPath, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Row(
          children: [
            Row(
              children: [
                iconPath == null
                    ? SizedBox.shrink()
                    : Image.asset(iconPath!, width: 25.w, height: 25.h),
                WidthSpacing(8),
                Text(
                  title ?? "",
                  style: AppStyles.black16w600.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios, size: 16.sp, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
