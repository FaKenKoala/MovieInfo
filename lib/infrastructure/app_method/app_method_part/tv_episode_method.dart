import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_info/domain/model/media/rate_content.dart';
import 'package:movie_info/infrastructure/app_method/app_method.dart';

part 'tv_episode_method.freezed.dart';

@freezed
class TVEpisodeMethod with _$TVEpisodeMethod implements AppMethod {
  const factory TVEpisodeMethod.getTVEpisodeDetail({
    required int tvId,
    required int seasonNumber,
    required int episodeNumber,
  }) = GetTVEpisodeDetail;

  const factory TVEpisodeMethod.getTVEpisodeAccountState({
    required int tvId,
    required int seasonNumber,
    required int episodeNumber,
  }) = GetTVEpisodeAccountState;

  const factory TVEpisodeMethod.getTVEpisodeChange({
    required int episodeId,
    DateTime? startDate,
    DateTime? endDate,
    int? page,
  }) = GetTVEpisodeChange;

  const factory TVEpisodeMethod.getTVEpisodeCredits({
    required int tvId,
    required int seasonNumber,
    required int episodeNumber,
  }) = GetTVEpisodeCredits;

  const factory TVEpisodeMethod.getTVEpisodeExternalID({
    required int tvId,
    required int seasonNumber,
    required int episodeNumber,
  }) = GetTVEpisodeExternalID;

  const factory TVEpisodeMethod.getTVEpisodeImage({
    required int tvId,
    required int seasonNumber,
    required int episodeNumber,
  }) = GetTVEpisodeImage;

  const factory TVEpisodeMethod.getTVEpisodeTranslations({
    required int tvId,
    required int seasonNumber,
    required int episodeNumber,
  }) = GetTVEpisodeTranslations;

  const factory TVEpisodeMethod.getTVEpisodeVideo({
    required int tvId,
    required int seasonNumber,
    required int episodeNumber,
  }) = GetTVEpisodeVideo;

  const factory TVEpisodeMethod.rateTVEpisode({
    required int tvId,
    required int seasonNumber,
    required int episodeNumber,
    required RateContent rateContent,
  }) = RateTVEpisode;

  const factory TVEpisodeMethod.deleteRateTVEpisode({
    required int tvId,
    required int seasonNumber,
    required int episodeNumber,
  }) = DeleteRateTVEpisode;
}
