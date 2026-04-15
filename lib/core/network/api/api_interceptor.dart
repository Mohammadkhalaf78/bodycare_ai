import 'package:bodycare_ai/core/cache/cache_helper.dart';
import 'package:bodycare_ai/core/network/api/end_point.dart';
import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] =CacheHelper().getData(key: ApiKey.token) != null ? 'Bearer ${CacheHelper().getData(key: ApiKey.token)}' : 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im1vaEBnbWFpbC5jb20iLCJfaWQiOiI2OThmMTg4ZTVhYjVkZDRhYjljYmM0YmQiLCJyb2xlIjoiVXNlciIsImlhdCI6MTc3MTQyODk3MSwiZXhwIjoxNzcxNTE1MzcxfQ.aMJOQPOY09J88xWDja3TjBOOVKSwPc8znPyJgnsvQos';
      //  = CacheHelper().getData(key: ApiKey.token) != null
      //       ? 'FOODAPI ${CacheHelper().getData(key: ApiKey.token)}'
      //       : null;
    super.onRequest(options, handler);
  }
}
