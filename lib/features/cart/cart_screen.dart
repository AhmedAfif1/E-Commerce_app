import 'package:ecommerce_app/core/Styling/app_styles.dart';
import 'package:ecommerce_app/core/widgets/primary_button_widget.dart';
import 'package:ecommerce_app/core/widgets/spacing_widget.dart';
import 'package:ecommerce_app/features/cart/widget/cart_item.dart';
import 'package:ecommerce_app/features/cart/widget/title_price.dart';
import 'package:ecommerce_app/features/cart/widget/total_price.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        centerTitle: true,
        leading: Container(),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CartItem(),
              CartItem(),
              CartItem(),
              HeightSpacing(145),
              TitlePrice(price: '1120 \$', title: 'Sub Total'),
              TitlePrice(price: 'Vat {16%}', title: ''),
              TitlePrice(price: 'Shipping Fees', title: 'Sub Total'),
              HeightSpacing(20),
              Divider(),
              TotalPrice(price: '1120 \$', title: 'Total'),
              HeightSpacing(20),
              PrimaryButtonWidget(
                tralingIcon: Icon(
                  Icons.payment,
                  color: Colors.white,
                  size: 16.sp,
                ),
                buttenText: 'Go To Checkout',
                onPrese: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
