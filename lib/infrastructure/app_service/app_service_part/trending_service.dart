part of '../app_service.dart';

mixin TrendingService on AppServicePart {
  /// Trending
  Future<PageResult<MediaTypeBase>> getTrending(GetTrending getTrending) async {
    return await remoteRepository.getTrending(
        getTrending.mediaType.name, getTrending.timeWindow.name);
  }
}
