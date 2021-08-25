import 'package:dartz/dartz.dart';
import 'package:movie_info/infrastructure/movie_method/movie_method.dart';

abstract class IMovieService {
  Future<Either<T, Exception>> execute<T>(MovieMethod method);
}
