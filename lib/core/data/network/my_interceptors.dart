import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../main.dart';

class MyInterceptor implements Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // String token = await getToken();
    //
    // options.headers["Authorization"] = "Bearer $token";
    print('Request URL: ${options.uri}');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode == 200) {
      print('Request successful!');
      print('Response data: ${response.data}');
    } else if (response.statusCode == 401) {
      print('Unauthorized access!');
      print('Response data: ${response.data}');
    } else {
      print('Request failed with status code: ${response.statusCode}');
      print('Response data: ${response.data}');
    }
    handler.next(response);
  }

  @override
  void onError(DioError error, ErrorInterceptorHandler handler) {
    print('Error message: ${error.message}');
    handler.next(error);
  }

  Future<String> getToken() async {
    // final value = await cacheStorage.read('Token') ??
    //     'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiIzNGE2YjI0OS0zMWUxLTRhOGYtOGExYy03MThjNzc4NmEwNzEiLCJ1bmlxdWVfbmFtZSI6Ik1HaGF6eSIsImVtYWlsIjoiR2hhenkiLCJuYmYiOjE2ODI4NjgxNjMsImV4cCI6MTc0NjAyNjU2MywiaWF0IjoxNjgyODY4MTYzLCJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjUwMDAifQ.BUhRXBsWc1_3FSQV7H1OGWMzFsL_HxJ6ojnK4V0rPIo';
    return "value";
  }

  Future<String> refreshToken() async {
    // Implement your token refresh logic here
    return "your_new_access_token";
  }
}
