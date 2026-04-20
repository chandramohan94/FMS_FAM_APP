// login_state.dart

import 'package:equatable/equatable.dart';
import 'package:upcl_fam_app/modules/login/model/loginresponse.dart';

abstract class LoginState extends Equatable  {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginResponse response;

  LoginSuccess({required this.response});

  @override
  List<Object?> get pragma => [response];
}

class LoginFailure extends LoginState {
  final String error;

  const LoginFailure({required this.error});

  @override
  List<Object> get props => [error];
}
