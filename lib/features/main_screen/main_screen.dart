import 'package:ecommerce_app/core/Styling/app_colors.dart';
import 'package:ecommerce_app/core/utils/service_locator.dart';
import 'package:ecommerce_app/features/account/account_screen.dart';
import 'package:ecommerce_app/features/cart/cart_screen.dart';
import 'package:ecommerce_app/features/home_screen/cubits/cubit/categories_cubit.dart';
import 'package:ecommerce_app/features/home_screen/cubits/cubit/products_cubit.dart';
import 'package:ecommerce_app/features/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndix = 0;
  List<Widget> screens = [
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<ProductsCubit>()),
        BlocProvider(create: (context) => sl<CategoriesCubit>()),
      ],
      child: HomeScreen(),
    ),
    CartScreen(),
    AccountScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: screens[currentIndix],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
          elevation: 1,
          selectedItemColor: AppColors.mainPrimaryColor,
          currentIndex: currentIndix,
          onTap: (value) {
            setState(() {
              currentIndix = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 30.sp),
              label: 'Home',
            ),

            // BottomNavigationBarItem(
            //   icon: Icon(Icons.manage_history, size: 30.sp),
            //   label: 'manage_history',
            // ),
            // BottomNavigationBarItem(
            //   icon: Container(
            //     width: 48.sp,
            //     height: 48.sp,
            //     decoration: BoxDecoration(
            //       shape: BoxShape.circle,
            //       color: AppColors.mainPrimaryColor,
            //     ),
            //     alignment: Alignment.center,
            //     child: Icon(Icons.add, color: Colors.white, size: 30.sp),
            //   ),
            //   label: 'Add',
            // ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart, size: 30.sp),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_3_outlined, size: 30.sp),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}
