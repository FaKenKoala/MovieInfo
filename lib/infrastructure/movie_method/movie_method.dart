import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_info/domain/model/enum_values/enum_values.dart';
import 'package:movie_info/domain/model/code_response/movie_exception.dart';
import 'package:movie_info/domain/model/movie/rate_content.dart';
part 'movie_method.freezed.dart';

typedef MovieExceptionEither<T> = Either<MovieException, T>;

@freezed
class MovieMethod with _$MovieMethod {
  /// Configuration
  const factory MovieMethod.getConfiguration() = GetConfiguration;

  /// Trending
  const factory MovieMethod.getTrending(
      {required MediaType mediaType,
      required TimeWindow timeWindow}) = GetTrending;

  /// Movies
  /// Get Movie Detail
  const factory MovieMethod.getMovieDetail(
      {required int movieId,
      String? language,
      String? appendToResponse}) = GetMovieDetail;

  /// Get Account State
  const factory MovieMethod.getMovieAccountState({
    required int movieId,
  }) = GetMovieAccountState;

  /// Get Alternative Titles
  const factory MovieMethod.getMovieAlternativeTitles({
    required int movieId,
    String? country,
  }) = GetMovieAlternativeTitles;

  /// Get Movie Changes
  const factory MovieMethod.getMovieChanges({
    required String movieId,
    String? startDate,
    String? endDate,
    int? page,
  }) = GetMovieChanges;

  /// Get Movie Credits
  const factory MovieMethod.getMovieCredit({
    required int movieId,
    String? language,
  }) = GetMovieCredit;

  /// Get Movie External Ids
  const factory MovieMethod.getMovieExternalId({
    required int movieId,
  }) = GetMovieExternalId;

  /// Get Movie Images
  const factory MovieMethod.getMovieImage({
    required int movieId,
    String? language,
  }) = GetMovieImage;

  /// Get Movie keyword
  const factory MovieMethod.getMovieKeyword({
    required int movieId,
  }) = GetMovieKeyword;

  /// Get Movie Lists belongs to
  const factory MovieMethod.getMovieList({
    required int movieId,
    String? language,
    int? page,
  }) = GetMovieBelongList;

  /// Get Movie Recommendation
  const factory MovieMethod.getMoveiRecommendation({
    required int movieId,
    String? language,
    int? page,
  }) = GetMovieRecommendation;

  /// Get Movie Release Date
  const factory MovieMethod.getMovieReleaseDate({
    required int movieId,
  }) = GetMovieReleaseDate;

  /// Get Movie Review
  const factory MovieMethod.getMovieReview({
    required int movieId,
    String? language,
    int? page,
  }) = GetMovieReview;

  /// Get Movie Similar
  const factory MovieMethod.getMovieSimilar({
    required int movieId,
    String? language,
    int? page,
  }) = GetSimilarMovie;

  /// Get Movie Translations
  const factory MovieMethod.getMovieTranslation({
    required int movieId,
  }) = GetMovieTranslation;

  /// Get Movie Video
  const factory MovieMethod.getMovieVideo({
    required int movieId,
    String? language,
  }) = GetMovieVideo;

  /// Get Watch Provider
  const factory MovieMethod.getMovieWatchProvider({
    required int movieId,
  }) = GetMovieWatchProvider;

  /// Rate Movie
  const factory MovieMethod.rateMovie({
    required int movieId,
    required RateContent rateContent,
  }) = RateMovie;

  /// Delete Movie Rate
  const factory MovieMethod.deleteMovieRate({
    required int movieId,
  }) = DeleteMovieRate;

  /// Get Latest Movie
  const factory MovieMethod.getLatestMovie() = GetLatestMovie;

  /// Get now playing Movie
  const factory MovieMethod.getNowPlayingMovie(
      {String? language, int? page, String? region}) = GetNowPlayingMovie;

  /// Get Now playing Movie
  const factory MovieMethod.getPopularMovie(
      {String? language, int? page, String? region}) = GetPopularMovie;

  /// Get Top Rated Movie
  const factory MovieMethod.getTopRatedMovie(
      {String? language, int? page, String? region}) = GetTopRatedMovie;

      /// Get Upcoming Movie
  const factory MovieMethod.getUpcomingMovie(
      {String? language, int? page, String? region}) = GetUpcomingMovie;
}
