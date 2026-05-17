import 'package:bodycare_ai/core/network/api/api_consumer.dart';
import 'package:bodycare_ai/core/network/api/api_interceptor.dart';
// ignore: library_prefixes
import 'package:bodycare_ai/core/network/end_point/end_point.dart' as EndPoint;
import 'package:bodycare_ai/core/network/errors/server_exception.dart';
import 'package:dio/dio.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = EndPoint.baseUrl;
    dio.interceptors.add(ApiInterceptor());
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    ));
  }

  @override
  Future delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFromData = false,
  }) async {
    try {
      final response = await dio.delete(
        path,
        data: isFromData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future get(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFromData = false,
  }) async {
    try {
      final response = await dio.patch(
        path,
        data: isFromData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

@override
Future post(
  String path, {
  dynamic data,
  Map<String, dynamic>? queryParameters,
  bool isFromData = false,
}) async {
  try {
    final response = await dio.post(
      path,
      data: isFromData ? FormData.fromMap(data) : data,
      queryParameters: queryParameters,
      options: Options(
        // ✅ خلي الـ Dio يقبل كل الـ status codes ومتعملش throw
        validateStatus: (status) => status != null && status < 600,
      ),
    );
    
    // ✅ لو 500 ارجع الـ data زي ما هي
    if (response.statusCode == 500) {
      print('⚠️ Server 500: ${response.data}');
      return response.data;
    }
    
    return response.data;
  } on DioException catch (e) {
    handleDioExceptions(e);
  }
}

}