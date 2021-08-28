part of '../remote_repository.dart';

mixin GuestSessionRepository {
  @GET('/guest_session/{${Constants.GuestSessionID}}/rated/movies')
  Future<PageResult<Movie>> getRatedMovies(
    @Path('${Constants.GuestSessionID}') String guestSessionID,

    /// created_at.asc, created_at.desc
    String? sortBy,
  );

  @GET('/guest_session/{${Constants.GuestSessionID}}/rated/tv')
  Future<PageResult<TV>> getRatedTVs(
    @Path('${Constants.GuestSessionID}') String guestSessionID,

    /// created_at.asc, created_at.desc
    String? sortBy,
  );

  @GET('/guest_session/{${Constants.GuestSessionID}}/rated/tv/episodes')
  Future<PageResult<TVEpisode>> getRatedTVEpisodes(
    @Path('${Constants.GuestSessionID}') String guestSessionID,

    /// created_at.asc, created_at.desc
    String? sortBy,
  );
}
