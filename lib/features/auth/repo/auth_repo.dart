import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/networking/api_end_points.dart';
import 'package:ecommerce_app/core/networking/dio_helper.dart';
import 'package:ecommerce_app/features/auth/models/login_response_model.dart';

class AuthRepo {
  final DioHelper _dioHelper;
  AuthRepo(this._dioHelper);

  Future<Either<String, LoginResponseModel>> logIn(
    String email,
    String password,
  ) async {
    try {
      final response = await _dioHelper.postRequest(
        endPoint: ApiEndPoints.login,
        data: {'username': email, 'password': password},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        LoginResponseModel loginResponse = LoginResponseModel.fromJson(
          response.data,
        );
        return Right(loginResponse);
      } else {
        return Left(response.toString());
      }
    } catch (e) {
      if (e is DioException) {
        return Left(e.response.toString());
      }
      return Left(e.toString());
    }
  }
}
