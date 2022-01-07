
import 'package:dio/dio.dart';
import 'package:score_cursos/app/common/custom_dio/custom.interceptor.dart';

class CustomDio{

  Dio client;

  CustomDio(this.client){
    client.interceptors.add(CustomInterceptor());
  }

}