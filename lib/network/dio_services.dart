import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://78.47.37.158:1201/VanSalesService/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    return await dio!.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
  }) async {
    dio!.options.headers = {
      'fyear': '2021',
      'userid': '5fa9a1f9-629a-4c40-9826-fc27d7c1b131',
    };
    return dio!.post(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
