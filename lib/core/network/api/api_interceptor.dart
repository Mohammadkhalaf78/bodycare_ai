import 'package:bodycare_ai/core/cache/cache_helper.dart';
import 'package:bodycare_ai/core/network/api/end_point.dart';
import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] =
        CacheHelper().getData(key: ApiKey.token) != null
    // ? 'Bearer ${CacheHelper().getData(key: ApiKey.token)}'
    ;
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNAZ21haWwuY29tIiwiX2lkIjoiNjllZjg2YzJiOGI5MGZlMmYwZmNhMGRiIiwicm9sZSI6IlVzZXIiLCJpYXQiOjE3NzczMTAyNzQsImV4cCI6MTc3NzM5NjY3NH0.qNYBX-hhnZgC8sLL_EEeRLhIVqN0tZt9I61Y3yq6JY0';
    super.onRequest(options, handler);
  }
}
