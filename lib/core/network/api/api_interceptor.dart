import 'package:bodycare_ai/core/cache/cache_helper.dart';
import 'package:bodycare_ai/core/network/api/end_point.dart';
import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  static const _testToken =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImZhZHlAZXhhbXBsZS5jb20iLCJfaWQiOiI2YTExNDE5YjY1ZjQ1MDVkMjhmNWY0ODMiLCJyb2xlIjoiVXNlciIsIm5hbWUiOiJkci4gYWhtZWQgaGFzc2FuIiwiaWF0IjoxNzc5NTU4NDYzLCJleHAiOjE3Nzk2NDQ4NjN9.IOw939rA2A8x28RPwiS62N_IKmNNjvdUQVf18SaCerU';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = CacheHelper().getData(key: ApiKey.token) ?? _testToken;
    options.headers['Authorization'] = 'Bearer $token';
    super.onRequest(options, handler);
  }
}


