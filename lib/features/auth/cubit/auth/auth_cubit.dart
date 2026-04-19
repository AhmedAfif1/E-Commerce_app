import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/auth/cubit/auth/auth_state.dart';
import 'package:ecommerce_app/features/auth/models/login_response_model.dart';
import 'package:ecommerce_app/features/auth/repo/auth_repo.dart';
import 'package:meta/meta.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepo) : super(AuthInitial());
  final AuthRepo _authRepo;
  void logIn(String email, String password) async {
    emit(AuthLoading());
    final Either<String, LoginResponseModel> res = await _authRepo.logIn(
      email,
      password,
    );
    res.fold((error) {
      emit(AuthFailure(error));
    }, (loginResponse) {
      emit(AuthSuccess("Login Successfully"));
    });
  }
}
