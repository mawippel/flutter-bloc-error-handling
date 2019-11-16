import 'package:flutter_error_handling/src/shared/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_error_handling/src/shared/dio/interceptors.dart';

class CustomDio {
  final Dio client;

  CustomDio(this.client) {
    client.options.baseUrl = BASE_URL;
    client.interceptors.add(CustomInterceptor());
    client.options.connectTimeout = 5000;
  }
}
