import 'package:bodycare_ai/core/cache/cache_helper.dart';
import 'package:bodycare_ai/core/network/api/end_point.dart';
import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImpvQGdtYWlsLmNvbSIsIl9pZCI6IjY5ODM1NmIzNmJjZTM0OTFjNGUzMDViMiIsInJvbGUiOiJVc2VyIiwiaWF0IjoxNzcwMjQyMDIwLCJleHAiOjE3NzAzMjg0MjB9.BFolQ9HNlhaoGo_RFB1TqqjWG6qc3sd16UOPasRck2Q';
      //  = CacheHelper().getData(key: ApiKey.token) != null
      //       ? 'FOODAPI ${CacheHelper().getData(key: ApiKey.token)}'
      //       : null;
    super.onRequest(options, handler);
  }
}
