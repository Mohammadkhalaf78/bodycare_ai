import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImZhZHlAZXhhbXBsZS5jb20iLCJfaWQiOiI2OTdiYzJhMjkxMzdhYzNlY2RiY2ZjYWMiLCJyb2xlIjoiVXNlciIsImlhdCI6MTc3MDY1OTUxMSwiZXhwIjoxNzcwNzQ1OTExfQ.xLvHATvPXhyY06xC8F1bue0w97w6DGxeNzlLyELqjtI';
      //  = CacheHelper().getData(key: ApiKey.token) != null
      //       ? 'FOODAPI ${CacheHelper().getData(key: ApiKey.token)}'
      //       : null;
    super.onRequest(options, handler);
  }
}
