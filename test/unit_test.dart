import 'package:movie_info/application/get_it/get_it_main.dart';
import 'package:movie_info/domain/model/movie/movie.dart';
import 'package:movie_info/domain/service/i_app_service.dart';
import 'package:test/test.dart';

void main() {
  late IAppService service;
  late Movie globalMovie;
  setUp(() async {
    await configureGetIt();
    service = getIt<IAppService>();
  });


}
