import 'package:ecommerce_app/core/Styling/app_styles.dart';
import 'package:ecommerce_app/core/widgets/spacing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressItem extends StatelessWidget {
  final String address;
  final String addressDetails;
  const AddressItem({
    required this.address,
    required this.addressDetails,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),

        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(width: .5, color: Colors.grey),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          children: [
            Icon(Icons.place_outlined, color: Colors.grey, size: 32.sp),
            WidthSpacing(16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(address, style: AppStyles.black15BoldStyle),
                HeightSpacing(8),
                Text(addressDetails, style: AppStyles.grey12w500),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
