import 'package:dio/dio.dart';
import 'package:movie_info/application/get_it/get_it_main.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

addDioLogger() {
  getIt<Dio>().interceptors..add(PrettyDioLogger(responseBody: true));
}

removeDioLogger() {
  getIt<Dio>().interceptors.removeWhere(
      (element) => element is LogInterceptor || element is PrettyDioLogger);
}
