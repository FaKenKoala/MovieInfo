part of '../app_service.dart';

mixin WatchProviderService on AppServicePart {
  /// TV Details
  get getAvailableRegions => remoteRepository.getAvailableRegions;
  get getMovieProviders => remoteRepository.getMovieProviders;
  get getTVProviders => remoteRepository.getTVProviders;
}
