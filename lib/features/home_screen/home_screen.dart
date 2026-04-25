import 'package:ecommerce_app/core/Routing/app_rotes.dart';
import 'package:ecommerce_app/core/Styling/app_colors.dart';
import 'package:ecommerce_app/core/Styling/app_styles.dart';
import 'package:ecommerce_app/core/widgets/custom_text_filed.dart';
import 'package:ecommerce_app/core/widgets/loading_lottie.dart';
import 'package:ecommerce_app/core/widgets/spacing_widget.dart';
import 'package:ecommerce_app/features/home_screen/cubits/cubit/categories_cubit.dart';
import 'package:ecommerce_app/features/home_screen/cubits/cubit/products_cubit.dart';
import 'package:ecommerce_app/features/home_screen/models/products_model.dart';
import 'package:ecommerce_app/features/home_screen/widgets/catogeri_Item.dart';
import 'package:ecommerce_app/features/home_screen/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCat = "All";
  @override
  void initState() {
    context.read<ProductsCubit>().fetchProducts();
    context.read<CategoriesCubit>().fetchCategories();
    super.initState();
  }

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
          BlocBuilder<CategoriesCubit, CategoriesState>(
            builder: (context, state) {
              if (state is CategoriesLoaded) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: state.categories.map((cat) {
                      return CatogeriItem(
                        catogeryName: cat,
                        isSelected: selectedCat == cat ? true : false,
                        onPress: () {
                          setState(() {
                            selectedCat = cat;
                            if (selectedCat == "All") {
                              context.read<ProductsCubit>().fetchProducts();
                            } else {
                              context
                                  .read<ProductsCubit>()
                                  .fetchCategoriesProducts(cat);
                            }
                          });
                        },
                      );
                    }).toList(),
                  ),
                );
              } else {
                return SizedBox.shrink();
              }
            },
          ),
          HeightSpacing(16),
          BlocBuilder<ProductsCubit, ProductsState>(
            builder: (context, state) {
              if (state is ProductsLoading) {
                return LoadingLottie(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .5,
                );
              }
              if (state is ProductsLoaded) {
                List<ProductsModel> products = state.products;
                return Expanded(
                  child: RefreshIndicator(
                    backgroundColor: Colors.white,
                    color: AppColors.mainPrimaryColor,
                    onRefresh: () async {
                      selectedCat = "All";

                      setState(() {});
                      context.read<ProductsCubit>().fetchProducts();
                    },
                    child: GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8.sp,
                        crossAxisSpacing: 16.sp,
                        childAspectRatio: .8,
                      ),
                      children: products.map((product) {
                        return ProductItem(
                          imaage: product.image ?? "",
                          title: product.title ?? "",
                          price: product.price.toString(),
                          onTap: () {

                            context.pushNamed(AppRotes.productScreen,extra: product);
                          },
                        );
                      }).toList(),
                    ),
                  ),
                );
              }
              return Center(
                child: Text(
                  'There is an error',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 55.sp,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
