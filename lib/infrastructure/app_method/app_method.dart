import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_info/domain/model/enum_values/enum_values.dart';
import 'package:movie_info/domain/model/code_response/app_exception.dart';
import 'package:movie_info/domain/model/enum_values/sort_by.dart';
import 'package:movie_info/domain/model/movie/rate_content.dart';
part 'app_method.freezed.dart';

typedef AppExceptionEither<T> = Either<AppException, T>;

@freezed
class AppMethod with _$AppMethod {
  /// Configuration
  const factory AppMethod.getConfiguration() = GetConfiguration;

  /// Trending
  const factory AppMethod.getTrending(
      {required MediaType mediaType,
      required TimeWindow timeWindow}) = GetTrending;

  /// Movies
  /// Get Movie Detail
  const factory AppMethod.getMovieDetail(
      {required int movieId,
      String? language,
      String? appendToResponse}) = GetMovieDetail;

  /// Get Account State
  const factory AppMethod.getMovieAccountState({
    required int movieId,
  }) = GetMovieAccountState;

  /// Get Alternative Titles
  const factory AppMethod.getMovieAlternativeTitles({
    required int movieId,
    String? country,
  }) = GetMovieAlternativeTitles;

  /// Get Movie Changes
  const factory AppMethod.getMovieChanges({
    required String movieId,
    String? startDate,
    String? endDate,
    int? page,
  }) = GetMovieChanges;

  /// Get Movie Credits
  const factory AppMethod.getMovieCredit({
    required int movieId,
    String? language,
  }) = GetMovieCredit;

  /// Get Movie External Ids
  const factory AppMethod.getMovieExternalId({
    required int movieId,
  }) = GetMovieExternalId;

  /// Get Movie Images
  const factory AppMethod.getMovieImage({
    required int movieId,
    String? language,
  }) = GetMovieImage;

  /// Get Movie keyword
  const factory AppMethod.getMovieKeyword({
    required int movieId,
  }) = GetMovieKeyword;

  /// Get Movie Lists belongs to
  const factory AppMethod.getMovieList({
    required int movieId,
    String? language,
    int? page,
  }) = GetMovieBelongList;

  /// Get Movie Recommendation
  const factory AppMethod.getMoveiRecommendation({
    required int movieId,
    String? language,
    int? page,
  }) = GetMovieRecommendation;

  /// Get Movie Release Date
  const factory AppMethod.getMovieReleaseDate({
    required int movieId,
  }) = GetMovieReleaseDate;

  /// Get Movie Review
  const factory AppMethod.getMovieReview({
    required int movieId,
    String? language,
    int? page,
  }) = GetMovieReview;

  /// Get Movie Similar
  const factory AppMethod.getMovieSimilar({
    required int movieId,
    String? language,
    int? page,
  }) = GetSimilarMovie;

  /// Get Movie Translations
  const factory AppMethod.getMovieTranslation({
    required int movieId,
  }) = GetMovieTranslation;

  /// Get Movie Video
  const factory AppMethod.getMovieVideo({
    required int movieId,
    String? language,
  }) = GetMovieVideo;

  /// Get Watch Provider
  const factory AppMethod.getMovieWatchProvider({
    required int movieId,
  }) = GetMovieWatchProvider;

  /// Rate Movie
  const factory AppMethod.rateMovie({
    required int movieId,
    required RateContent rateContent,
  }) = RateMovie;

  /// Delete Movie Rate
  const factory AppMethod.deleteMovieRate({
    required int movieId,
  }) = DeleteMovieRate;

  /// Get Latest Movie
  const factory AppMethod.getLatestMovie() = GetLatestMovie;

  /// Get now playing Movie
  const factory AppMethod.getNowPlayingMovie(
      {String? language, int? page, String? region}) = GetNowPlayingMovie;

  /// Get Now playing Movie
  const factory AppMethod.getPopularMovie(
      {String? language, int? page, String? region}) = GetPopularMovie;

  /// Get Top Rated Movie
  const factory AppMethod.getTopRatedMovie(
      {String? language, int? page, String? region}) = GetTopRatedMovie;

  /// Get Upcoming Movie
  const factory AppMethod.getUpcomingMovie(
      {String? language, int? page, String? region}) = GetUpcomingMovie;

  /// Get TV Detail
  const factory AppMethod.getTVDetail(
      {required int tvId,
      String? language,
      String? appendToResponse}) = GetTVDetail;

  /// Discover Movie
  const factory AppMethod.discoverMovie({
    String? language,
    String? region,
    // String? sortBy,
    @Default(SortByKeyword.Popularity) SortByKeyword sortByKeyword,
    @Default(SortByDirection.DESC) SortByDirection sortByDirection,
    String? certificationCountry,
    String? certification,
    String? certificationLte,
    String? certificationGte,
    bool? includeAdult,
    bool? includeVideo,
    int? page,
    int? primaryReleaseYear,
    String? primaryReleaseDateGte,
    String? primaryReleaseDateLte,
    String? releaseDateGte,
    String? releaseDateLte,
    int? withReleaseType,
    int? year,
    int? voteCountGte,
    int? voteCountLte,
    num? voteAverageGte,
    num? voteAverageLte,
    String? withCast,
    String? withCrew,
    String? withPeople,
    String? withCompanies,
    String? withGenres,
    String? withoutGenres,
    String? withKeywords,
    String? withoutKeywords,
    int? withRuntimeGte,
    int? withRuntimeLte,
    String? withOriginalLanguage,
    String? withWatchProviders,
    String? watchRegion,
    @Default(MonetizationType.FlatRate)
        MonetizationType withWatchMonetizationTypes,
  }) = DiscoverMovie;

  /// Discover TV
  const factory AppMethod.discoverTV({
    String? language,
    // String? sortBy,
    @Default(SortByKeyword.Popularity) SortByKeyword sortByKeyword,
    @Default(SortByDirection.DESC) SortByDirection sortByDirection,
    String? airDateGte,
    String? airDateLte,
    String? firstAirDateGte,
    String? firstAirDateLte,
    int? firstAirDateYear,
    int? page,
    String? timezone,
    num? voteAverageGte,
    int? voteCountGte,
    String? withGenres,
    String? withNetworks,
    String? withoutGenres,
    int? withRuntimeGte,
    int? withRuntimeLte,
    bool? includeNullFirstAirDates,
    String? withOriginalLanguage,
    String? withoutKeywords,
    bool? screenedTheatrically,
    String? withCompanies,
    String? withKeywords,
    String? withWatchProviders,
    String? watchRegion,
    @Default(MonetizationType.FlatRate)
        MonetizationType withWatchMonetizationTypes,
  }) = DiscoverTV;
}
