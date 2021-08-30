part of '../remote_repository.dart';

mixin TrendingRepository {

  @GET('/trending/movie/{time_window}')
  Future<PageResult<Movie>> getMovieTrending(
    @Path('time_window') String timeWindow,
  );

  @GET('/trending/tv/{time_window}')
  Future<PageResult<TV>> getTVTrending(
    @Path('time_window') String timeWindow,
  );

  @GET('/trending/person/{time_window}')
  Future<PageResult<Person>> getPersonTrending(
    @Path('time_window') String timeWindow,
  );
  @GET('/trending/{media_type}/{time_window}')
  Future<PageResult<MediaTypeBase>> getTrending(
    @Path('media_type') String mediaType,
    @Path('time_window') String timeWindow,
  );
}
