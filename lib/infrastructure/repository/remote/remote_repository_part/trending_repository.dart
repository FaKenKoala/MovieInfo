part of '../remote_repository.dart';

mixin TrendingRepository {
  @GET('/trending/{media_type}/{time_window}')
  Future<PageResult<MediaTypeBase>> getTrending(
    @Path('media_type') String mediaType,
    @Path('time_window') String timeWindow,
  );
}
