import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/Styling/app_styles.dart';
import 'package:ecommerce_app/core/widgets/primary_button_widget.dart';
import 'package:ecommerce_app/core/widgets/spacing_widget.dart';
import 'package:ecommerce_app/features/home_screen/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductScreen extends StatelessWidget {
  final ProductsModel product;
  const ProductScreen({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details'), centerTitle: true),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeightSpacing(20),
                  Container(
                    width: 341.w,
                    height: 341.h,
                   child: CachedNetworkImage(imageUrl: product.image ??""),
                  ),
                  const HeightSpacing(12),
                  Text(
                    product.title ?? "",
                    style: AppStyles.black16w600.copyWith(fontSize: 24.sp),
                  ),
                  const HeightSpacing(8),
                  Row(
                    children: [
                      Icon(Icons.star, size: 18.sp, color: Colors.orange),
                      WidthSpacing(2),

                      product.rating != null
                          ? Text(
                              '${product.rating?.rate}/5 ',
                              style: AppStyles.black15BoldStyle.copyWith(
                                decoration: TextDecoration.underline,
                              ),
                            )
                          : SizedBox.shrink(),
                      WidthSpacing(2),
                      product.rating != null
                          ? Text(
                              '(${product.rating?.count} reviews)',
                              style: AppStyles.grey12w500.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.sp,
                              ),
                            )
                          : SizedBox.shrink(),
                    ],
                  ),
                  HeightSpacing(13),
                  Text(
                    product.description ?? "",
                    style: AppStyles.grey12w500.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  HeightSpacing(100),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Divider(),
                  const HeightSpacing(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Price',
                            style: AppStyles.grey12w500.copyWith(
                              fontSize: 16.sp,
                            ),
                          ),
                          HeightSpacing(4),
                          Text(
                            '${product.price} \$',
                            style: AppStyles.black16w600.copyWith(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      WidthSpacing(16),
                      PrimaryButtonWidget(
                        icon: Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                          size: 16.sp,
                        ),
                        buttenText: 'Add To Cart',
                        onPrese: () {},
                        width: MediaQuery.of(context).size.width * .5,
                      ),
                    ],
                  ),
                  HeightSpacing(8),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
