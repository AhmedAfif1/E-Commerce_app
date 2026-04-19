import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/Routing/router_genration_config.dart';
import 'package:ecommerce_app/core/Styling/theme_data.dart';
import 'package:ecommerce_app/core/networking/dio_helper.dart';
import 'package:ecommerce_app/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  setupServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeDataStyle.lightTheme,
          routerConfig: RouterGenrationConfig.goRouter,
        );
      },
    );
  }
}
