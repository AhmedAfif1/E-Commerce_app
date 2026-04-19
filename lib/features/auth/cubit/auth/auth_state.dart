abstract class AuthState {}

 class AuthInitial extends AuthState {}
 class AuthLoading extends AuthState {}
 class AuthSuccess extends AuthState {

    final String errorMessage;
  AuthSuccess(this.errorMessage);
 }
 class AuthFailure extends AuthState {
  final String errorMessage;
  AuthFailure(this.errorMessage);
 }
