import 'package:bodycare_ai/core/cache/cache_helper.dart';
import 'package:bodycare_ai/core/network/api/end_point.dart';
import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = 'Bearer ${CacheHelper().getData(key: ApiKey.token)}';
      //  = CacheHelper().getData(key: ApiKey.token) != null
      //       ? 'FOODAPI ${CacheHelper().getData(key: ApiKey.token)}'
      //       : null;
    super.onRequest(options, handler);
  }
}
