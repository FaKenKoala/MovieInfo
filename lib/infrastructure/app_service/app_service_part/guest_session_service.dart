part of '../app_service.dart';

mixin GuestSessionService on AppServicePart {
  Future<PageResult<Movie>> getRatedMovies(String? sortBy) {
    return remoteRepository.getRatedMovies(guestSessionID, sortBy);
  }

  Future<PageResult<TV>> getRatedTVs(String? sortBy) {
    return remoteRepository.getRatedTVs(guestSessionID, sortBy);
  }

  Future<PageResult<TVEpisode>> getRatedTVEpisodes(String? sortBy) {
    return remoteRepository.getRatedTVEpisodes(guestSessionID, sortBy);
  }

  String get guestSessionID =>
      AppConfig.instance.guestSession?.guestSessionId ?? '';
}
