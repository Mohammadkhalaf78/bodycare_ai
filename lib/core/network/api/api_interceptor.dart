import 'package:bodycare_ai/core/cache/cache_helper.dart';
import 'package:bodycare_ai/core/network/api/end_point.dart';
import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] =
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNAZ21haWwuY29tIiwiX2lkIjoiNjllZjg2YzJiOGI5MGZlMmYwZmNhMGRiIiwicm9sZSI6IlVzZXIiLCJuYW1lIjoibW9oYW1tZWQiLCJpYXQiOjE3Nzg5NDQ5NjIsImV4cCI6MTc3OTAzMTM2Mn0.vm7sCdHLKYPhp5eX4UqW6xRGj63ANV6AdmROO8xvdlQ';
    // CacheHelper().getData(key: ApiKey.token) != null
    //     ? 'Bearer ${CacheHelper().getData(key: ApiKey.token)}'
    //     : 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNAZ21haWwuY29tIiwiX2lkIjoiNjllZjg2YzJiOGI5MGZlMmYwZmNhMGRiIiwicm9sZSI6IlVzZXIiLCJpYXQiOjE3Nzc1ODA4MTQsImV4cCI6MTc3NzY2NzIxNH0.VwWc5kAEz5dhwRl1uXK4neZbsUJpnfiToGo8TV39etc';
    super.onRequest(options, handler);
  }
}
