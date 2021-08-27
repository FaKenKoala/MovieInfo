part of '../remote_repository.dart';

mixin WatchProvidersRepository {
  @GET('/watch/providers/regions')
  Future<ListResult<Region>> getAvailableRegions();

  @GET('/watch/providers/movie')
  Future<ListResult<WatchProvider>> getMovieProviders(
    @Query('watch_region') String? watchRegion,
  );

  @GET('/watch/providers/tv')
  Future<ListResult<WatchProvider>> getTVProviders(
    @Query('watch_region') String? watchRegion,
  );
}
