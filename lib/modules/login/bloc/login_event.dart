// login_event.dart

import 'package:equatable/equatable.dart';
import 'package:upcl_fam_app/modules/login/model/LoginRequest.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginButtonPressed extends LoginEvent {
  final LoginRequest loginRequest;

  const LoginButtonPressed({required this.loginRequest});

  @override
  List<Object> get props => [loginRequest];
}

