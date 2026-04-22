import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_state.dart';
import '../data/login_repository.dart';
import '../data/login_request.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository repo;

  LoginCubit(this.repo) : super(LoginInitial());

  Future<void> login(String user, String pass) async {
    emit(LoginLoading());

    try {
      final req = LoginRequest(
        userImei: "863592052710813",
        appReleaseId: "FAM32",
        username: user,
        password: pass,
      );

      final res = await repo.login(req);
      emit(LoginSuccess(res));
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }
}