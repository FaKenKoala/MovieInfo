part of '../app_service.dart';

mixin PersonService on AppServicePart {
  Future getPersonChanges(
      int personId, DateTime? startDate, DateTime? endDate, int? page) async {
    return await remoteRepository.getPersonChanges(personId,
        DateUtil.format(startDate), DateUtil.format(endDate), page ?? 1);
  }
}
