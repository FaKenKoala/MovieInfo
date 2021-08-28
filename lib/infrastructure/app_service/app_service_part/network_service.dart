part of '../app_service.dart';

mixin NetworkService on AppServicePart {
  get getNetworkDetail => remoteRepository.getNetworkDetail;

  get getNetworkAlternativeNames => remoteRepository.getNetworkAlternativeNames;

  get getNetworkLogos => remoteRepository.getNetworkLogos;
}
