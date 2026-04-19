import 'dart:developer';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:dartz/dartz.dart' as either;
import 'package:ecommerce_app/core/Routing/app_rotes.dart';
import 'package:ecommerce_app/core/Styling/app_colors.dart';
import 'package:ecommerce_app/core/Styling/app_styles.dart';
import 'package:ecommerce_app/core/utils/animated_snack_bar.dart';
import 'package:ecommerce_app/core/utils/service_locator.dart';
import 'package:ecommerce_app/core/widgets/custom_text_filed.dart';
import 'package:ecommerce_app/core/widgets/loading_lottie.dart';
import 'package:ecommerce_app/core/widgets/primary_button_widget.dart';
import 'package:ecommerce_app/core/widgets/spacing_widget.dart';
import 'package:ecommerce_app/features/auth/cubit/auth/auth_cubit.dart';
import 'package:ecommerce_app/features/auth/cubit/auth/auth_state.dart';
import 'package:ecommerce_app/features/auth/models/login_response_model.dart';
import 'package:ecommerce_app/features/auth/repo/auth_repo.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController username;
  late TextEditingController password;
  @override
  void initState() {
    super.initState();
    username = TextEditingController();
    password = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthFailure) {
              ShowAnimatedSnackDiolog(context,message: state.errorMessage,type: AnimatedSnackBarType.error);
            }
            if (state is AuthSuccess) {
              ShowAnimatedSnackDiolog(context,message: state.errorMessage,type: AnimatedSnackBarType.success);
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return LoadingLottie();
            }

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeightSpacing(12),
                      HeightSpacing(28),
                      SizedBox(
                        width: 335.w,
                        child: Text(
                          'Login to your account',
                          style: AppStyles.primaryHeadLineStyle,
                        ),
                      ),

                      HeightSpacing(8),
                      SizedBox(
                        width: 335.w,
                        child: Text(
                          'It’s great to see you again.',
                          style: AppStyles.primaryHeadLineStyle.copyWith(
                            color: AppColors.mainSecanderyColor,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),

                      HeightSpacing(32),
                      Text('User Name', style: AppStyles.black16w600),
                      HeightSpacing(8),

                      CustomTextFiled(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Your User Name';
                          }
                          return null;
                        },
                        controller: username,
                        hintText: 'Enter Your User Name',
                      ),
                      HeightSpacing(16),
                      Text('Password', style: AppStyles.black16w600),
                      HeightSpacing(8),

                      CustomTextFiled(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Your Password';
                          }
                          if (value.length > 6) {
                            return 'Password must be at leaset 6 cherates';
                          }

                          return null;
                        },
                        controller: password,
                        hintText: 'Enter Your Password',
                        suffix: Icon(
                          Icons.remove_red_eye,
                          size: 20.sp,
                          color: AppColors.greyColor,
                        ),
                      ),

                      HeightSpacing(55),
                      PrimaryButtonWidget(
                        buttenText: 'Sign in',
                        onPrese: () {
                          if (formKey.currentState!.validate()) {
                            context.read<AuthRepo>().logIn(
                              username.text,
                              password.text,
                            );
                          }
                        },
                      ),
                      HeightSpacing(290), //important

                      Center(
                        child: RichText(
                          text: TextSpan(
                            text: 'Don’t have an account?',
                            style: AppStyles.black16w600.copyWith(
                              color: AppColors.mainSecanderyColor,
                            ),
                            children: [
                              TextSpan(
                                text: 'Join',
                                style: AppStyles.black16w600,
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    GoRouter.of(
                                      context,
                                    ).pushNamed(AppRotes.registerScreen);
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                      HeightSpacing(10),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
