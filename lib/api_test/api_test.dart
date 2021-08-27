import 'package:dio/dio.dart';
import 'package:movie_info/application/get_it/get_it_main.dart';
import 'package:movie_info/domain/model/tv/tv.dart';
import 'package:movie_info/domain/service/i_app_service.dart';
import 'package:movie_info/infrastructure/app_method/app_method_part/tv_method.dart';
import 'package:movie_info/infrastructure/util/dio_logger.dart';
import 'package:movie_info/infrastructure/util/http_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiTest {
  static ApiTest? _instance;

  final _service = getIt<IAppService>();

  void apiTest(TV tv) {
    tvApiTest(tv);
  }

  /// TV
  void tvApiTest(TV tv) {
    // service.execute(GetTVAccountState(tvId: tv.id));
    _service.execute(GetTVAggregateCredit(tvId: tv.id));
  }

  ApiTest._() {
    addDioLogger(
        PrettyDioLogger(requestHeader: true, requestBody: true,responseBody: false, error: false));
    getIt<Dio>()..interceptors.add(HttpInterceptor());
  }
  static ApiTest get instance {
    if (_instance == null) {
      _instance = ApiTest._();
    }

    return _instance!;
  }
}
