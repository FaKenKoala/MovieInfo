import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_info/domain/model/movie/rate_content.dart';
import 'package:movie_info/infrastructure/app_method/app_method.dart';
part 'movie_method.freezed.dart';

@freezed
class MovieMethod with _$MovieMethod implements AppMethod {
  /// Movies
  /// Get Movie Detail
  const factory MovieMethod.getMovieDetail({
    required int movieId,
  }) = GetMovieDetail;

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
    required int movieId,
    String? startDate,
    String? endDate,
    int? page,
  }) = GetMovieChanges;

  /// Get Movie Credits
  const factory MovieMethod.getMovieCredit({
    required int movieId,
  }) = GetMovieCredit;

  /// Get Movie External Ids
  const factory MovieMethod.getMovieExternalId({
    required int movieId,
  }) = GetMovieExternalId;

  /// Get Movie Images
  const factory MovieMethod.getMovieImage({
    required int movieId,
  }) = GetMovieImage;

  /// Get Movie keyword
  const factory MovieMethod.getMovieKeyword({
    required int movieId,
  }) = GetMovieKeyword;

  /// Get Movie Lists belongs to
  const factory MovieMethod.getMovieBelongList({
    required int movieId,
    int? page,
  }) = GetMovieBelongList;

  /// Get Movie Recommendation
  const factory MovieMethod.getMovieRecommendation({
    required int movieId,
    int? page,
  }) = GetMovieRecommendation;

  /// Get Movie Release Date
  const factory MovieMethod.getMovieReleaseDate({
    required int movieId,
  }) = GetMovieReleaseDate;

  /// Get Movie Review
  const factory MovieMethod.getMovieReview({
    required int movieId,
    int? page,
  }) = GetMovieReview;

  /// Get Movie Similar
  const factory MovieMethod.getSimilarMovie({
    required int movieId,
    int? page,
  }) = GetSimilarMovie;

  /// Get Movie Translations
  const factory MovieMethod.getMovieTranslation({
    required int movieId,
  }) = GetMovieTranslation;

  /// Get Movie Video
  const factory MovieMethod.getMovieVideo({
    required int movieId,
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
  const factory MovieMethod.getNowPlayingMovie({int? page, String? region}) =
      GetNowPlayingMovie;

  /// Get Now playing Movie
  const factory MovieMethod.getPopularMovie({int? page, String? region}) =
      GetPopularMovie;

  /// Get Top Rated Movie
  const factory MovieMethod.getTopRatedMovie({int? page, String? region}) =
      GetTopRatedMovie;

  /// Get Upcoming Movie
  const factory MovieMethod.getUpcomingMovie({int? page, String? region}) =
      GetUpcomingMovie;
}
