import 'package:dio/dio.dart';

class ApiClient {
  ApiClient._() {}
  static ApiClient _Api = ApiClient._();

  Dio _dio = Dio();
  static ApiClient getInstance() {
    return _Api;
  }

  get(String url) {
    print("hitting $url");
    Future<Response> future =  _dio.get(url);
    return future;
  }
}
