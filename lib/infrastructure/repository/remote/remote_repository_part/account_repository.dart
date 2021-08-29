part of '../remote_repository.dart';

const AccountPrefix = '/account/{$CAccountID}';
const CAccountID = 'account_id';
mixin AccountRepository {
  @GET('/account')
  Future<Account> getAccountDetail();

  @GET('$AccountPrefix/lists')
  Future<PageResult<MediaList>> getCreatedList(
    @Path(CAccountID) int accountId,
    @Query('page') int? page,
  );

  @GET('$AccountPrefix/facorite/movies')
  Future<PageResult<Movie>> getFavoriteMovies(
    @Path(CAccountID) int accountId,
    String? sortBy,
    int? page,
  );

  @GET('$AccountPrefix/facorite/tv')
  Future<PageResult<TV>> getFavoriteTVs(
    @Path(CAccountID) int accountId,
    String? sortBy,
    int? page,
  );

  @POST('$AccountPrefix/favorite')
  Future<CodeResponse> markAsFavorite(
    @Path(CAccountID) int accountId,
    @Body() MarkFavoriteContent favorite,
  );

  @GET('$AccountPrefix/rated/movies')
  Future<PageResult<Movie>> getAccountRatedMovies(
    @Path(CAccountID) int accountId,
    String? sortBy,
    int? page,
  );

  @GET('$AccountPrefix/rated/tv')
  Future<PageResult<TV>> getAccountRatedTVs(
    @Path(CAccountID) int accountId,
    String? sortBy,
    int? page,
  );

  @GET('$AccountPrefix/rated/tv/episodes')
  Future<PageResult<TVEpisode>> getAccountRatedTVEpisodes(
    @Path(CAccountID) int accountId,
    String? sortBy,
    int? page,
  );

  @GET('$AccountPrefix/watchlist/movies')
  Future<PageResult<Movie>> getWatchlistMovies(
    @Path(CAccountID) int accountId,
    String? sortBy,
    int? page,
  );

  @GET('$AccountPrefix/watchlist/tv')
  Future<PageResult<TV>> getWatchlistTVs(
    @Path(CAccountID) int accountId,
    String? sortBy,
    int? page,
  );

  @GET('$AccountPrefix/facorite/tv')
  Future<CodeResponse> addToWatchlist(
    @Path(CAccountID) int accountId,
    @Body() AddtoWatchlistContent watchlist,
  );
}
