part of '../app_service.dart';

mixin TrendingService on AppServicePart {
  Future<PageResult<Movie>> getMovieTrending(
      GetMovieTrending getTrending) async {
    return await remoteRepository.getMovieTrending(getTrending.timeWindow.name);
  }

  Future<PageResult<TV>> getTVTrending(GetTVTrending getTrending) async {
    return await remoteRepository.getTVTrending(getTrending.timeWindow.name);
  }

  Future<PageResult<Person>> getPersonTrending(
      GetPersonTrending getTrending) async {
    return await remoteRepository.getPersonTrending(getTrending.timeWindow.name);
  }

  /// Trending
  Future<PageResult<MediaTypeBase>> getTrending(GetTrending getTrending) async {
    return await remoteRepository.getTrending(
        getTrending.mediaType.name, getTrending.timeWindow.name);
  }
}
