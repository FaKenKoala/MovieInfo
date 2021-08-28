part of '../app_service.dart';

mixin TVSeasonService on AppServicePart {
  Future<ChangeList> getTVSeasonChange(
      int seasonId, DateTime? startDate, DateTime? endDate, int? page) async {
    return await remoteRepository.getTVSeasonChange(
        seasonId, DateUtil.format(startDate), DateUtil.format(endDate), page);
  }

  get getTVSeasonDetail => remoteRepository.getTVSeasonDetail;

  get getTVSeasonAccountState => remoteRepository.getTVSeasonAccountState;

  get getTVSeasonAggregatedCredits =>
      remoteRepository.getTVSeasonAggregatedCredits;

  get getTVSeasonCredits => remoteRepository.getTVSeasonCredits;

  get getTVSeasonExternalID => remoteRepository.getTVSeasonExternalID;

  get getTVSeasonImage => remoteRepository.getTVSeasonImage;

  get getTVSeasonTranslations => remoteRepository.getTVSeasonTranslations;

  get getTVSeasonVideos => remoteRepository.getTVSeasonVideos;
}
