import 'package:dartz/dartz.dart';
import 'package:movie_info/application/get_it/get_it_main.dart';
import 'package:movie_info/domain/model/enum_values/enum_values.dart';
import 'package:movie_info/domain/model/movie/movie.dart';
import 'package:movie_info/domain/model/api_result/page_result.dart';
import 'package:movie_info/domain/service/i_app_service.dart';
import 'package:movie_info/infrastructure/app_method/app_method.dart';
import 'package:test/test.dart';

void main() {
  late IAppService service;
  late Movie globalMovie;
  setUp(() async {
    await configureGetIt();
    service = getIt<IAppService>();
  });


}
