import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_info/infrastructure/app_method/app_method.dart';

part 'tv_season_method.freezed.dart';

@freezed
class TVSeasonMethod with _$TVSeasonMethod implements AppMethod {
  const factory TVSeasonMethod.getTVSeasonDetail({
    required int tvId,
    required int seasonNumber,
  }) = GetTVSeasonDetail;

  const factory TVSeasonMethod.getTVSeasonAccountState({
    required int tvId,
    required int seasonNumber,
  }) = GetTVSeasonAcountState;

  const factory TVSeasonMethod.getTVSeasonAggregatedCredits({
    required int tvId,
    required int seasonNumber,
  }) = GetTVSeasonAggregatedCredits;

  const factory TVSeasonMethod.getTVSeasonChange({
    required int seasonId,
    DateTime? startDate,
    DateTime? endDate,
    int? page,
  }) = GetTVSeasonChange;

  const factory TVSeasonMethod.getTVSeasonCredits({
    required int tvId,
    required int seasonNumber,
  }) = GetTVSeasonCredits;

  const factory TVSeasonMethod.getTVSeasonExternalID({
    required int tvId,
    required int seasonNumber,
  }) = GetTVSeasonExternalID;

  const factory TVSeasonMethod.getTVSeasonImage({
    required int tvId,
    required int seasonNumber,
  }) = GetTVSeasonImage;

  const factory TVSeasonMethod.getTVSeasonTranslations({
    required int tvId,
    required int seasonNumber,
  }) = GetTVSeasonTranslations;

  const factory TVSeasonMethod.getTVSeasonVideos({
    required int tvId,
    required int seasonNumber,
  }) = GetTVSeasonVideos;
}
