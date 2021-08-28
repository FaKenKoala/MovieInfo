part of '../app_service.dart';

mixin TVEpisodeService on AppServicePart {
  Future<ChangeList> getTVEpisodeChange(
      int episodeId, DateTime? startDate, DateTime? endDate, int? page) async {
    return await remoteRepository.getTVEpisodeChange(
        episodeId, DateUtil.format(startDate), DateUtil.format(endDate), page);
  }

  get getTVEpisodeDetail => remoteRepository.getTVEpisodeDetail;

  get getTVEpisodeAccountState => remoteRepository.getTVEpisodeAccountState;

  get getTVEpisodeCredits => remoteRepository.getTVEpisodeCredits;

  get getTVEpisodeExternalID => remoteRepository.getTVEpisodeExternalID;

  get getTVEpisodeImage => remoteRepository.getTVEpisodeImage;

  get getTVEpisodeTranslations => remoteRepository.getTVEpisodeTranslations;

  get getTVEpisodeVideo => remoteRepository.getTVEpisodeVideo;

  get rateTVEpisode => remoteRepository.rateTVEpisode;

  get deleteRateTVEpisode => remoteRepository.deleteRateTVEpisode;
}
