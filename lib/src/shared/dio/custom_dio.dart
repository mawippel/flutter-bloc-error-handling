import 'package:flutter_error_handling/src/shared/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_error_handling/src/shared/dio/interceptors.dart';

class CustomDio extends Dio {

  CustomDio(){
    options.baseUrl = BASE_URL;
    interceptors.add(CustomInterceptions());
    options.connectTimeout = 5000;
  }

}