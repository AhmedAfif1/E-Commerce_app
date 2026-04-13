import 'package:ecommerce_app/core/Styling/app_styles.dart';
import 'package:ecommerce_app/core/widgets/spacing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 16.h),
      child: Container(
        padding: EdgeInsets.all(16.sp),
        decoration: BoxDecoration(
          border: Border.all(width: .5, color: Colors.grey),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 83.w,
              height: 79.h,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            WidthSpacing(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('T Shirt', style: AppStyles.black18BoldStyle),
                      Spacer(),
                      Icon(Icons.delete, color: Colors.red),
                    ],
                  ),
                  HeightSpacing(30),
                  Row(
                    children: [
                      Text('1200 \$', style: AppStyles.black15BoldStyle),
                      Spacer(),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: 24.w,
                              height: 24.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey, width: .5),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Icon(Icons.add, size: 16.sp),
                            ),
                          ),
                          WidthSpacing(8),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: 24.w,
                              height: 24.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey, width: .5),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Icon(Icons.remove, size: 16.sp),
                            ),
                          ),
                        ],
                      ),
                    ],
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
