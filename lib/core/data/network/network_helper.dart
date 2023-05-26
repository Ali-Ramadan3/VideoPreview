import 'dart:async';
import 'package:dio/dio.dart';
import 'APi_constants.dart';
import 'my_interceptors.dart';

class NetworkHelper {
  final _dio = Dio();

  NetworkHelper() {
    _dio.options.baseUrl = APiConstants.baseURL;
    _dio.interceptors.add(MyInterceptor());
  }

  Future<dynamic> get({required String path}) async {
    try {
      Response response = await _dio.get(path);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> post({required String path, dynamic data}) async {
    try {
      Response response = await _dio.post(path, data: data);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> put({required String path, dynamic data}) async {
    try {
      Response response = await _dio.put(path, data: data);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> delete({required String path, dynamic data}) async {
    try {
      Response response = await _dio.delete(path, data: data);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
