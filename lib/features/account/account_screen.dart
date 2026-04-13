import 'package:ecommerce_app/core/Routing/app_rotes.dart';
import 'package:ecommerce_app/core/Styling/app_assets.dart';
import 'package:ecommerce_app/core/Styling/app_styles.dart';
import 'package:ecommerce_app/core/widgets/spacing_widget.dart';
import 'package:ecommerce_app/features/account/widget/account_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
        centerTitle: true,
        leading: Container(),
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeightSpacing(24),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Divider(),
          ),
          AccountItem(
            title: 'My Orders',
            iconPath: AppAssets.box,
            onTap: () {},
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Divider(),
          ),
          AccountItem(
            title: 'My Details',
            iconPath: AppAssets.details,
            onTap: () {},
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Divider(),
          ),
          AccountItem(
            title: 'Address Book',
            iconPath: AppAssets.address,
            onTap: () {
              context.pushNamed(AppRotes.addressScreen);
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Divider(),
          ),

          AccountItem(
            title: 'FAQs',
            iconPath: AppAssets.question,
            onTap: () {},
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Divider(),
          ),

          AccountItem(
            title: 'Help Center',
            iconPath: AppAssets.headPhone,
            onTap: () {},
          ),
          Divider(thickness: 8.w, color: Color(0xffE6E6E6)),
          Spacer(),
          InkWell(
            onTap: () {},
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 16.h,
                  ),
                  child: Icon(
                    Icons.logout,
                    color: Colors.redAccent,
                    size: 25.sp,
                  ),
                ),
                WidthSpacing(16),
                Text(
                  'Logout',
                  style: AppStyles.black16w600.copyWith(
                    fontWeight: FontWeight.w400,
                    color: Colors.redAccent,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
