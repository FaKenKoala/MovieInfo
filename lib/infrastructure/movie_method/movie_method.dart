import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_info/domain/model/enum_values/enum_values.dart';
part 'movie_method.freezed.dart';

typedef ExceptionEither<T> = Either<Exception, T>;

@freezed
class MovieMethod with _$MovieMethod {
  /// Configuration
  const factory MovieMethod.configuration() = GetConfiguration;

  /// Trending
  const factory MovieMethod.trending(
      {required MediaType mediaType,
      required TimeWindow timeWindow}) = GetTrending;

  /// Movies
  /// Get Movie Detail
  const factory MovieMethod.movieDetail(
      {required int movieId,
      String? language,
      String? appendToResponse}) = GetMovieDetail;

  /// Get Account State
  const factory MovieMethod.movieAccountState({
    required int movieId,
  }) = GetMovieAccountState;

  /// Get Alternative Titles
  const factory MovieMethod.movieAlternativeTitles({
    required int movieId,
    String? country,
  }) = GetMovieAlternativeTitles;

  /// Get Movie Changes
  const factory MovieMethod.movieChanges({
    required String movieId,
    String? startDate,
    String? endDate,
    int? page,
  }) = GetMovieChanges;

  /// Get Movie Credits
  const factory MovieMethod.movieCredit({
    required int movieId,
    String? language,
  }) = GetMovieCredit;

  /// Get Movie External Ids
  const factory MovieMethod.movieExternalId({
    required int movieId,
  }) = GetMovieExternalId;
}
