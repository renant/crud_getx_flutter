import 'package:dio/dio.dart';
import 'package:product_crud/shared/dio/dio_interceptors.dart';

class DioFactory {
  static Dio createDio() {
    Dio dio = Dio();

    dio.options.baseUrl = "http://10.0.2.2:3000";
    dio.interceptors.add(CustomInterceptors());

    return dio;
  }
}
