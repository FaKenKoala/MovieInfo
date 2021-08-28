part of '../app_service.dart';

mixin CollectionService on AppServicePart {
  get getCollectionDetail => remoteRepository.getCollectionDetail;

  get getCollectionImages => remoteRepository.getCollectionImages;

  get getCollectionTranslations => remoteRepository.getCollectionTranslations;
}
