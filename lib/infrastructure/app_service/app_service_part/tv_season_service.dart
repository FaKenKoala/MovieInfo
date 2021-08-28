part of '../app_service.dart';

mixin TVSeasonService on AppServicePart {

  Future<ChangeList> getTVSeasonChange(
      int seasonId, DateTime? startDate, DateTime? endDate, int? page) async {
    return await remoteRepository.getTVSeasonChange(
        seasonId, DateUtil.format(startDate), DateUtil.format(endDate), page);
  }
}
