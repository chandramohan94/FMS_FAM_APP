import 'package:dio/dio.dart';

class DioProvider {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://appservices.upcl.org:8443/famapp/api/v1/",
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        "Content-Type": "application/json",
      },
    ),
  );
}