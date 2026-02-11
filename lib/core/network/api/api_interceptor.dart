import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImZhZHlAZXhhbXBsZS5jb20iLCJfaWQiOiI2OTdiYzJhMjkxMzdhYzNlY2RiY2ZjYWMiLCJyb2xlIjoiVXNlciIsImlhdCI6MTc3MDc5Nzg2MywiZXhwIjoxNzcwODg0MjYzfQ.fzb06QLcjNYKFpjJ5-zECkBCXV_3kMiv7UHEMaYvcAw';
      //  = CacheHelper().getData(key: ApiKey.token) != null
      //       ? 'FOODAPI ${CacheHelper().getData(key: ApiKey.token)}'
      //       : null;
    super.onRequest(options, handler);
  }
}
