import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/Styling/app_styles.dart';
import 'package:ecommerce_app/core/widgets/spacing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatelessWidget {
  final String title;
  final String price;
  final String imaage;
  final Function()? onTap;
  const ProductItem({
    required this.imaage,
    required this.onTap,
    required this.price,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(8.r),
              child: CachedNetworkImage(width: 150.w, height: 150.h,fit: BoxFit.cover,imageUrl: imaage,),
            ),
            HeightSpacing(8),
            Text(title, style: AppStyles.black15BoldStyle,maxLines: 1,),
            HeightSpacing(8),
            Text(
              price,
              style: AppStyles.grey12w500.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
