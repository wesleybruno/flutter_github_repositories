import 'package:dio/dio.dart';

class ResquestInterceptor extends Interceptor {
  @override
  onRequest(RequestOptions options) async {
    print("REQUEST[${options?.method}] => PATH: ${options.baseUrl + options?.path} \n DATA: ${options.data}");
  }

  @override
  onResponse(Response response) {
    print(
        "RESPONSE[${response?.statusCode}] => PATH: ${response.request.baseUrl + response?.request?.path} \n RESULT: ${response.data}");
    return super.onResponse(response);
  }

  @override
  onError(DioError e) {
    print("ERROR[${e?.response?.statusCode}] => PATH: ${e.request.baseUrl + e?.request?.path} \n DATA: ${e.response.data}");
    return super.onError(e);
  }

}
