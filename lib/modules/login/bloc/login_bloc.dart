import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upcl_fam_app/modules/login/bloc/login_event.dart';
import 'package:upcl_fam_app/modules/login/bloc/login_state.dart';
import 'package:upcl_fam_app/modules/login/service/ApiService.dart';



class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ApiService _apiService = ApiService();
  LoginBloc() : super(LoginInitial()) {
    // Register event handler for LoginButtonPressed event
    on<LoginButtonPressed>(_onLoginButtonPressed);
  }

  // Event handler for LoginButtonPressed event
  void _onLoginButtonPressed(LoginButtonPressed event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    try {
      final response = await _apiService.login(event.loginRequest);


      if (response != null) {
        print(response.empDesigId);
        print(response.empOfficeName);

        emit(LoginSuccess(response: response));
      } else {
        emit(LoginFailure(error: 'Invalid username or password'));
      }
    } catch (error) {
      emit(LoginFailure(error: 'An error occurred'));
    }
  }
}
