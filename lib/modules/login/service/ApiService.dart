import 'dart:convert';
import 'package:dio/dio.dart';
import '../../consumerDetails/model/BillHistoryReqModel.dart';
import '../../consumerDetails/model/BillHistoryResModel.dart';
import '../model/LoginRequest.dart';
import '../model/loginresponse.dart';

class ApiService {

  final Dio _dio = Dio();

  Future<LoginResponse?> login(LoginRequest loginRequest) async {
    final String baseUrl = 'https://appservices.upcl.org:8443/famapp/api/v1/LoginProcess/login';
    print("api first service");
    try {
      final response = await _dio.post(
        baseUrl,
        data: loginRequest.toJson(),
      );

      if (response.statusCode == 200) {
        print("enter positive");
        return LoginResponse.fromJson(response.data);
      } else {
        print('Request failed with status: ${response.statusCode}');
        return null;
      }
    } catch (error) {
      print('Error: $error');
      return null;
    }
  }
  final String baseUrl = 'https://www.upcl.org/wssservices/api/v1';

  Future<BillHistoryResModel> fetchBillHistory(BillHistoryReqModel request) async {
    final dio = Dio();
    print("api service");
    final uri = Uri.parse(baseUrl + '/ExternalInBillHistory')
        .replace(queryParameters: request.toQueryParameters());
    print("api service $uri");
    try {
      final response = await dio.postUri(
        uri,
        data: json.encode({}), // Empty JSON object
        options: Options(
          headers: {
            'did': '5b57dee9a74d7e7ff7b9f106de4744bbupcl',
            'servicekey': '0b83dbcae5e74174362412b2d38e210aupcl',
            'Content-Type': 'application/json',
          },
        ),
      );

      print(response.toString());

      if (response.statusCode == 200) {
        // Ensure the response is parsed correctly
        final Map<String, dynamic> responseData = json.decode(response.data);
        return BillHistoryResModel.fromJson(responseData);
      } else if (response.statusCode == 401) {
        print('Unauthorized request. Please check your credentials.');
        throw Exception('Unauthorized request');
      } else if (response.statusCode == 417) {
        print('Expectation Failed. Please check the request and try again.');
        throw Exception('Expectation Failed: ${response.data}');
      } else {
        print('Request failed with status: ${response.statusCode}');
        throw Exception('Failed to load bill history');
      }
    } catch (e) {
      print('Exception caught: $e');
      throw Exception('Failed to load bill history: $e');
    }
  }


}
