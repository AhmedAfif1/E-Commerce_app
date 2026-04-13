import 'dart:developer';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:dartz/dartz.dart' as either;
import 'package:ecommerce_app/core/Routing/app_rotes.dart';
import 'package:ecommerce_app/core/Styling/app_colors.dart';
import 'package:ecommerce_app/core/Styling/app_styles.dart';
import 'package:ecommerce_app/core/utils/animated_snack_bar.dart';
import 'package:ecommerce_app/core/widgets/custom_text_filed.dart';
import 'package:ecommerce_app/core/widgets/primary_button_widget.dart';
import 'package:ecommerce_app/core/widgets/spacing_widget.dart';
import 'package:ecommerce_app/features/auth/models/login_response_model.dart';
import 'package:ecommerce_app/features/auth/repo/auth_repo.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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
    AuthRepo().logIn('mor_2314', '83r5^_').then((
      either.Either<String, LoginResponseModel> res,
    ) {
      res.fold(
        (Error) {
          ShowAnimatedSnackDiolog(
            context,
            type: AnimatedSnackBarType.error,
            message: Error,
          );
          log(Error);
        },
        (isRight) {
          ShowAnimatedSnackDiolog(  
            context,
            type: AnimatedSnackBarType.success,
            message: 'Login Successfully',
          );
          log(isRight.toJson().toString());
        },
      );
      setState(() {});
    });
    // TODO: implement initState
    super.initState();
    username = TextEditingController();
    password = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
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
                      if (value.length > 8) {
                        return 'Password must be at leaset 8 cherates';
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
                      GoRouter.of(context).pushNamed(AppRotes.mainScreen);
                      // if (formKey.currentState!.validate()) {
                      //   GoRouter.of(
                      //     context,
                      //   ).pushNamed(AppRotes.verifyLoginScreen);
                      // }
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
        ),
      ),
    );
  }
}
