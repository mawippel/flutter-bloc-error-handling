import 'package:dio/dio.dart';
import 'package:flutter_error_handling/src/shared/dio/custom_dio.dart';
import 'package:flutter_error_handling/src/shared/models/post_model.dart';

class HomeRepository {
  
  final CustomDio _client;

  HomeRepository(this._client);

  Future<List<PostModel>> getPosts() async {
    try {
      var response = await _client.client.get('/posts');
      return (response.data as List).map((item) => PostModel.fromJson(item)).toList();
    } on DioError catch (e) {
      throw(e.message);
    }
  }

  Future<int> createPost(Map<String, dynamic> data) async {
    try {
      var response = await _client.client.post('/posts', data: data);
      return response.statusCode;
    } on DioError catch (e) {
      throw (e.message);
    }
  }
  
}