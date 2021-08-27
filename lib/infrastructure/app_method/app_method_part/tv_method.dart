import 'package:freezed_annotation/freezed_annotation.dart';
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
}
