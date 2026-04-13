import 'package:ecommerce_app/core/Styling/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class LoadingLottie extends StatelessWidget {
  final double? width;
  final double? height;
  const LoadingLottie({this.height, this.width, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width,
      height: height ?? MediaQuery.of(context).size.height,
      child: LottieBuilder.asset(
        AppAssets.loadingLottie,
        width: 100.sp,
        height: 100.sp,
      ),
    );
  }
}
