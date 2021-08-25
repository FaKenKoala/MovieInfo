import 'package:movie_info/infrastructure/movie_method/movie_method.dart';

abstract class IMovieService {
  Future<ExceptionEither<T>> execute<T>(MovieMethod method);
}
