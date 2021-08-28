part of '../app_service.dart';

mixin GuestSessionService on AppServicePart {
  Future<PageResult<Movie>> getRatedMovies(String? sessionID, String? sortBy) {
    return remoteRepository.getRatedMovies(sessionID ?? guestSessionID, sortBy);
  }

  Future<PageResult<TV>> getRatedTVs(String? sessionID, String? sortBy) {
    return remoteRepository.getRatedTVs(sessionID ?? guestSessionID, sortBy);
  }

  Future<PageResult<TVEpisode>> getRatedTVEpisodes(String? sessionID, String? sortBy) {
    return remoteRepository.getRatedTVEpisodes(sessionID ?? guestSessionID, sortBy);
  }


  String get guestSessionID =>
      AppConfig.instance.guestSession?.guestSessionId ?? '';
}
