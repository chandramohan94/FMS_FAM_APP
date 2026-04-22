
import '../data/login_response.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}



class LoginSuccess extends LoginState {
  final LoginResponse response;

  LoginSuccess(this.response);
}

class LoginError extends LoginState {
  final String error;
  LoginError(this.error);
}