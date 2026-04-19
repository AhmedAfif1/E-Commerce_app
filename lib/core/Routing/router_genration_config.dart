import 'package:ecommerce_app/core/Routing/app_rotes.dart';
import 'package:ecommerce_app/core/utils/service_locator.dart';
import 'package:ecommerce_app/features/address/address_screen.dart';
import 'package:ecommerce_app/features/auth/cubit/auth/auth_cubit.dart';
import 'package:ecommerce_app/features/auth/login_screen.dart';
import 'package:ecommerce_app/features/auth/register_screen.dart';
import 'package:ecommerce_app/features/main_screen/main_screen.dart';
import 'package:ecommerce_app/features/product_details/product_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RouterGenrationConfig {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRotes.loginScreen,
    routes: [
      GoRoute(
        name: AppRotes.loginScreen,
        path: AppRotes.loginScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => sl<AuthCubit>(),
          child: LoginScreen(),
        ),
      ),
      GoRoute(
        name: AppRotes.registerScreen,
        path: AppRotes.registerScreen,
        builder: (context, state) => RegisterScreen(),
      ),
      GoRoute(
        name: AppRotes.mainScreen,
        path: AppRotes.mainScreen,
        builder: (context, state) => MainScreen(),
      ),
      GoRoute(
        name: AppRotes.productScreen,
        path: AppRotes.productScreen,
        builder: (context, state) => ProductScreen(),
      ),
      GoRoute(
        name: AppRotes.addressScreen,
        path: AppRotes.addressScreen,
        builder: (context, state) => AddressScreen(),
      ),
    ],
  );
}
