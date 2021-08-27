import 'package:dio/dio.dart';
import 'package:movie_info/infrastructure/util/movie_logger.dart';
import 'package:url_launcher/url_launcher.dart';
class HttpInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // MovieLog.print('请求url:${options.uri}');
    launch('${options.uri}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
    super.onError(err, handler);
  }
}
