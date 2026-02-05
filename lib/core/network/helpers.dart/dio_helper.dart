
import 'package:bodycare_ai/core/network/end_point/end_point.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        headers: {'Content-Type': 'application/json'},
      ),
    );
  }

  static Future<Response> getData({
    required String endPoints,
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    try {
      dio.options.headers = {'Authorization': 'Bearer ${token ?? ''}'};
      final Response response = await dio.get(
        endPoints,
        queryParameters: queryParameters,
        // options: Options(headers: dio.options.headers),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
