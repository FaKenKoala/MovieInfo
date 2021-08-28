part of '../app_service.dart';

mixin WatchProviderService on AppServicePart {
  get getAvailableRegions => remoteRepository.getAvailableRegions;

  get getMovieProviders => remoteRepository.getMovieProviders;

  get getTVProviders => remoteRepository.getTVProviders;
}
