import 'package:movie_info/infrastructure/movie_method/movie_method.dart';

abstract class IMovieService {
  Future<MovieExceptionEither<T>> execute<T>(MovieMethod method);
}
