import 'package:ecommerce_app/core/Styling/app_assets.dart';
import 'package:ecommerce_app/core/Styling/app_styles.dart';
import 'package:ecommerce_app/core/widgets/spacing_widget.dart';
import 'package:ecommerce_app/features/account/widget/account_item.dart';
import 'package:ecommerce_app/features/address/widget/address_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Address'),
        centerTitle: true,
        //   leading: Container(),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeightSpacing(24),
            Divider(),
            const HeightSpacing(24),
            Text('Saved Address', style: AppStyles.black15BoldStyle),
            HeightSpacing(14),
            Expanded(
              child: ListView(
                children: [
                  AddressItem(
                    address: 'Home',
                    addressDetails: '925 S Chugach St #APT 10, Alas...',
                  ),
                  AddressItem(
                    address: 'Home',
                    addressDetails: '925 S Chugach St #APT 10, Alas...',
                  ),
                  AddressItem(
                    address: 'Home',
                    addressDetails: '925 S Chugach St #APT 10, Alas...',
                  ),
                  AddressItem(
                    address: 'Home',
                    addressDetails: '925 S Chugach St #APT 10, Alas...',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
