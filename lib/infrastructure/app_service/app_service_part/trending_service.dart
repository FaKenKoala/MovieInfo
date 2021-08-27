part of '../app_service.dart';

mixin TrendingService on AppServicePart {
  /// Trending
  Future<PageResult> getTrending(GetTrending getTrending) async {
    PageResult pageResult = await remoteRepository.getTrending(
        getTrending.mediaType.name, getTrending.timeWindow.name);
    List<dynamic> results = MediaTypeInDynaimc.fromList(pageResult.results);
    return pageResult.copyWith(results: results);
  }
}
