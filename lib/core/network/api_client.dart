import 'package:dio/dio.dart';
import 'dio_provider.dart';

class ApiClient {
  final Dio _dio = DioProvider.dio;

  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      return await _dio.get(path, queryParameters: queryParameters);
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? "GET failed");
    }
  }

  Future<Response> post(String path, {dynamic data}) async {
    try {
      return await _dio.post(path, data: data);
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? "POST failed");
    }
  }

  void setToken(String token) {
    _dio.options.headers["Authorization"] = "Bearer $token";
  }
}