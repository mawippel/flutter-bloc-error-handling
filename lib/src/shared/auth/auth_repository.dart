import 'package:dio/dio.dart';
import 'package:flutter_error_handling/src/shared/constants.dart';
import 'package:flutter_error_handling/src/shared/dio/interceptors.dart';

class AuthRepository {
  Dio _client;

  AuthRepository() {
    _client = Dio();
    _client.options.baseUrl = BASE_URL;
    _client.interceptors.add(CustomInterceptor());
  }

  Future<Map> login(Map<String, dynamic> data) async {
    try {
      var response = await _client.post("/sign_in", data: data);
      return response.data;
    } on DioError catch (e) {
      throw (e.message);
    }
  }
}
