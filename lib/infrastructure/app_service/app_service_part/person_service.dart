part of '../app_service.dart';

mixin PersonService on AppServicePart {
  Future<ChangeList> getPersonChanges(
      int personId, DateTime? startDate, DateTime? endDate, int? page) async {
    return await remoteRepository.getPersonChanges(personId,
        DateUtil.format(startDate), DateUtil.format(endDate), page ?? 1);
  }

  Future<PageResult<MediaImageItem>> getPersonTaggedImages(int personId) async {
    PageResult<MediaImageItem> result =
        await remoteRepository.getPersonTaggedImages(personId);

    final finalResult = result.copyWith(
        results: result.results.map((MediaImageItem item) {
      return item.copyWith(
          media: MediaTypeInDynaimc.mediaTypeInDynamic(
              item.media, item.mediaType));
    }).toList());
    return finalResult;
  }

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
