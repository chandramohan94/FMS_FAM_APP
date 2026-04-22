import '../../../core/network/api_client.dart';
import '../../../core/network/api_endpoints.dart';
import 'login_request.dart';
import 'login_response.dart';

class LoginRepository {
  final ApiClient api = ApiClient();

  Future<LoginResponse> login(LoginRequest request) async {
    final res = await api.post(
      ApiEndpoints.login,
      data: request.toJson(),
    );

    final data = LoginResponse.fromJson(res.data);

    if (data.status == "success") {
      api.setToken(data.jwt);
      return data;
    } else {
      throw Exception("Login Failed");
    }
  }
}