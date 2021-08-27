import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_info/domain/model/movie/rate_content.dart';
import 'package:movie_info/infrastructure/app_method/app_method.dart';
part 'tv_method.freezed.dart';

@freezed
class TVMethod with _$TVMethod implements AppMethod {
  /// Get TV Detail
  const factory TVMethod.getTVDetail(
      {required int tvId, String? appendToResponse}) = GetTVDetail;

  /// Get TV Account State
  const factory TVMethod.getTVAccountState({
    required int tvId,
  }) = GetTVAccountState;

  const factory TVMethod.getTVAggregateCredit({
    required int tvId,
  }) = GetTVAggregateCredit;

  /// Get Alternative Titles
  const factory TVMethod.getTVAlternativeTitles({
    required int tvId,
  }) = GetTVAlternativeTitles;

  /// Get TV Changes
  const factory TVMethod.getTVChanges({
    required int tvId,
    String? startDate,
    String? endDate,
    int? page,
  }) = GetTVChanges;

  const factory TVMethod.getTVContentRating({
    required int tvId,
  }) = GetTVContentRating;

  /// Get TV Credits
  const factory TVMethod.getTVCredit({
    required int tvId,
  }) = GetTVCredit;

  const factory TVMethod.getTVEpisodeGroups({
    required int tvId,
  }) = GetTVEpisodeGroups;

  /// Get TV External Ids
  const factory TVMethod.getTVExternalId({
    required int tvId,
  }) = GetTVExternalId;

  /// Get TV Images
  const factory TVMethod.getTVImage({
    required int tvId,
  }) = GetTVImage;

  /// Get TV keyword
  const factory TVMethod.getTVKeyword({
    required int tvId,
  }) = GetTVKeyword;

  const factory TVMethod.getTVRecommendation({
    required int tvId,
    int? page,
  }) = GetTVRecommendation;

  /// Get TV Review
  const factory TVMethod.getTVReview({
    required int tvId,
    int? page,
  }) = GetTVReview;

  /// Get TV Similar
  const factory TVMethod.getSimilarTV({
    required int tvId,
    int? page,
  }) = GetSimilarTV;

  /// Get TV Translations
  const factory TVMethod.getTVTranslation({
    required int tvId,
  }) = GetTVTranslation;

  /// Get TV Video
  const factory TVMethod.getTVVideo({
    required int tvId,
  }) = GetTVVideo;

  /// Get Watch Provider
  const factory TVMethod.getTVWatchProvider({
    required int tvId,
  }) = GetTVWatchProvider;

  /// Rate TV
  const factory TVMethod.rateTV({
    required int tvId,
    required RateContent rateContent,
  }) = RateTV;

  /// Delete TV Rate
  const factory TVMethod.deleteTVRate({
    required int tvId,
  }) = DeleteTVRate;

  /// Get Latest TV
  const factory TVMethod.getLatestTV() = GetLatestTV;

  /// Get now playing TV
  const factory TVMethod.getNowPlayingTV(
      { int? page, String? region}) = GetNowPlayingTV;

  /// Get Now playing TV
  const factory TVMethod.getPopularTV(
      {int? page, String? region}) = GetPopularTV;

  /// Get Top Rated TV
  const factory TVMethod.getTopRatedTV(
      { int? page, String? region}) = GetTopRatedTV;

  /// Get Upcoming TV
  const factory TVMethod.getUpcomingTV(
      { int? page, String? region}) = GetUpcomingTV;
}
