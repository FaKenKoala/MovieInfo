part of '../app_service.dart';

mixin PersonService on AppServicePart {
  Future<ChangeList> getPersonChanges(
      int personId, DateTime? startDate, DateTime? endDate, int? page) async {
    return await remoteRepository.getPersonChanges(personId,
        DateUtil.format(startDate), DateUtil.format(endDate), page ?? 1);
  }

  Future getPersonTaggedImages(GetPersonTaggedImages images) async {
    PageResult<MediaImageItem> result =
        await remoteRepository.getPersonTaggedImages(images.personId);

    final finalResult = result.copyWith(
        results: result.results.map((MediaImageItem item) {
      return item.copyWith(
          media: MediaTypeInDynaimc.mediaTypeInDynamic(
              item.media, item.mediaType));
    }).toList());
    return finalResult;
  }
}
