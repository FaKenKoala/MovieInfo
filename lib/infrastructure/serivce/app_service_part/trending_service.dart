part of '../app_service.dart';

mixin TrendingService on AppServicePart {
  /// Trending
  Future<PageResult> getTrending(GetTrending getTrending) async {
    PageResult pageResult = await remoteRepository.getTrending(
        mediaType: getTrending.mediaType.name,
        timeWindow: getTrending.timeWindow.name);
    List<dynamic> results = pageResult.results.map((e) {
      switch (enumDecodeNullable(MediaTypeEnumMap, e['media_type'],
          unknownValue: MediaType.ALL)) {
        case MediaType.MOVIE:
          return Movie.fromJson(e);
        case MediaType.TV:
          return TV.fromJson(e);
        case MediaType.PERSON:
          return Cast.fromJson(e);
        default:
          return e;
      }
    }).toList();
    return pageResult.copyWith(results: results);
  }
}
