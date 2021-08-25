import 'package:movie_info/domain/model/enum_values/media_type.dart';
import 'package:movie_info/domain/model/enum_values/time_window.dart';
import 'package:movie_info/domain/model/movie/movie.dart';
import 'package:movie_info/domain/model/result/result.dart';

abstract class IMovieService {
  Future<Result<Movie>> trending(
      {MediaType mediaType = MediaType.ALL,
      TimeWindow timeWindow = TimeWindow.DAY});
}
