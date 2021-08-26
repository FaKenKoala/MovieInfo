part of '../remote_repository.dart';

mixin TrendingPart {
  @GET('/trending/{media_type}/{time_window}')
  Future<PageResult> getTrending(
      {@Path('media_type') required String mediaType,
      @Path('time_window') required String timeWindow});
}
