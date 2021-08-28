part of '../app_service.dart';

mixin PersonService on AppServicePart {
  Future<ChangeList> getPersonChanges(
      int personId, DateTime? startDate, DateTime? endDate, int? page) async {
    return await remoteRepository.getPersonChanges(personId,
        DateUtil.format(startDate), DateUtil.format(endDate), page ?? 1);
  }

  get getPersonTaggedImages => remoteRepository.getPersonTaggedImages;

  get getPersonDetail => remoteRepository.getPersonDetail;

  get getPersonMovieCredits => remoteRepository.getPersonMovieCredits;

  get getPersonTVCredits => remoteRepository.getPersonTVCredits;

  get getPersonCombinedCredits => remoteRepository.getPersonCombinedCredits;

  get getPersonExternalIds => remoteRepository.getPersonExternalIds;

  get getPersonImages => remoteRepository.getPersonImages;

  get getPersonTranslations => remoteRepository.getPersonTranslations;

  get getLatestPerson => remoteRepository.getLatestPerson;

  get getPopularPerson => remoteRepository.getPopularPerson;
}
