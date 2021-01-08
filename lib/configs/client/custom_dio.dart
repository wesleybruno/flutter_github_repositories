import 'package:dio/dio.dart';
import 'package:github_repositories/configs/client/request_Interceptor.dart';

class CustomDio {
  Dio client;

  CustomDio() {
    client = Dio();
    client.options.baseUrl = 'https://api.github.com';
    client.interceptors.add(ResquestInterceptor());
    client.options.connectTimeout = 30000;
    client.options.receiveTimeout = 30000;
    client.options.validateStatus = validateStatus;
  }

  bool validateStatus(status) {
    return status < 500;
  }
}
