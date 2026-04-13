import 'package:ecommerce_app/core/Routing/app_rotes.dart';
import 'package:ecommerce_app/core/Styling/app_colors.dart';
import 'package:ecommerce_app/core/Styling/app_styles.dart';
import 'package:ecommerce_app/core/widgets/custom_text_filed.dart';
import 'package:ecommerce_app/core/widgets/spacing_widget.dart';
import 'package:ecommerce_app/features/home_screen/widgets/catogeri_Item.dart';
import 'package:ecommerce_app/features/home_screen/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeightSpacing(28),
          SizedBox(
            width: 335.w,
            child: Text('Discover', style: AppStyles.primaryHeadLineStyle),
          ),
          const HeightSpacing(16),
          Row(
            children: [
              CustomTextFiled(
                width: 270.w,
                hintText: 'Search for clothes...',
                suffix: Icon(Icons.search),
              ),
              WidthSpacing(8),
              Container(
                width: 52.w,
                height: 52.h,
                decoration: BoxDecoration(
                  color: AppColors.mainPrimaryColor,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(Icons.tune, color: Colors.white),
              ),
            ],
          ),
          const HeightSpacing(16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CatogeriItem(catogeryName: 'All'),
                CatogeriItem(catogeryName: 'All'),
                CatogeriItem(catogeryName: 'All'),
                CatogeriItem(catogeryName: 'All'),
                CatogeriItem(catogeryName: 'All'),
                CatogeriItem(catogeryName: 'All'),
              ],
            ),
          ),
          HeightSpacing(16),
          Expanded(
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8.sp,
                crossAxisSpacing: 16.sp,
                childAspectRatio: .8,
              ),
              children: [
                ProductItem(
                  price: '1,190 \$',
                  title: 'Shoes',
                  onTap: () {
                    GoRouter.of(context).pushNamed(AppRotes.productScreen);
                  },
                ),
                ProductItem(
                  price: '1,190 \$',
                  title: 'Shoes',
                  onTap: () {
                    GoRouter.of(context).pushNamed(AppRotes.productScreen);
                  },
                ),
                ProductItem(
                  price: '1,190 \$',
                  title: 'Shoes',
                  onTap: () {
                    GoRouter.of(context).pushNamed(AppRotes.productScreen);
                  },
                ),
                ProductItem(
                  price: '1,190 \$',
                  title: 'Shoes',
                  onTap: () {
                    GoRouter.of(context).pushNamed(AppRotes.productScreen);
                  },
                ),
                ProductItem(
                  price: '1,190 \$',
                  title: 'Shoes',
                  onTap: () {
                    GoRouter.of(context).pushNamed(AppRotes.productScreen);
                  },
                ),
                ProductItem(
                  price: '1,190 \$',
                  title: 'Shoes',
                  onTap: () {
                    GoRouter.of(context).pushNamed(AppRotes.productScreen);
                  },
                ),
                ProductItem(
                  price: '1,190 \$',
                  title: 'Shoes',
                  onTap: () {
                    GoRouter.of(context).pushNamed(AppRotes.productScreen);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
