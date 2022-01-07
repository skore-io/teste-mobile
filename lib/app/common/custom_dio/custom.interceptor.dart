import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class CustomInterceptor extends InterceptorsWrapper {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (kDebugMode) {
      print('REQUEST[${options.method}] => PATH: ${options.uri}');
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (kDebugMode) {
      print('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    }
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (kDebugMode) {
      print('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    }
    return super.onError(err, handler);
  }
}
