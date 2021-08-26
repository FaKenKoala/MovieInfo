import 'package:dartz/dartz.dart';
import 'package:movie_info/application/get_it/get_it_main.dart';
import 'package:movie_info/domain/model/enum_values/enum_values.dart';
import 'package:movie_info/domain/model/movie/movie.dart';
import 'package:movie_info/domain/model/page_result/page_result.dart';
import 'package:movie_info/domain/service/i_movie_service.dart';
import 'package:movie_info/infrastructure/movie_method/movie_method.dart';
import 'package:test/test.dart';

void main() {
  late IMovieService service;
  late Movie globalMovie;
  setUp(() async {
    await configureGetIt();
    service = getIt<IMovieService>();
  });

  _getMovieDetail() async {
    await service.execute(GetMovieDetail(movieId: globalMovie.id));
  }

  _getAlternativeTitles() async {
    await service.execute(GetMovieAlternativeTitles(movieId: globalMovie.id));
  }

  test('Remote Url Test', () async {
    /// Get Trending
    ExceptionEither<PageResult<Movie>> movies = await service.execute(
        GetTrending(mediaType: MediaType.MOVIE, timeWindow: TimeWindow.DAY));
    movies.toOption().flatMap<Movie>((movies) {
      if (movies.results.isNotEmpty) {
        return some(movies.results.first);
      }
      return none();
    }).flatMap((movie) {
      globalMovie = movie;
      _getMovieDetail();

      _getAlternativeTitles();

      return some(movie);
    });
  });
}
