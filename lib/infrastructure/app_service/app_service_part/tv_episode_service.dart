part of '../app_service.dart';

mixin TVEpisodeService on AppServicePart {
  Future<ChangeList> getTVEpisodeChange(
      int episodeId, DateTime? startDate, DateTime? endDate, int? page) async {
    return await remoteRepository.getTVEpisodeChange(
        episodeId, DateUtil.format(startDate), DateUtil.format(endDate), page);
  }
}
