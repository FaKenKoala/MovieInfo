part of '../remote_repository.dart';

const MoviePrefix = '/movie/{$MovieId}';
const MovieId = 'movie_id';
const Page = 'page';

/// Movie
mixin MovieRepository {
  @GET('$MoviePrefix')
  Future<Movie> getMovieDetail(@Path(MovieId) int movieId,
      @Query('append_to_response') String? appendToResponse);

  @GET('$MoviePrefix/account_states')
  Future<AccountState> getMovieAccountState(@Path(MovieId) int movieId);

  @GET('$MoviePrefix/alternative_titles')
  Future<IDResult<Title>> getMovieAlternativeTitles(
    @Path(MovieId) int movieId,
    @Query('country') String? country,
  );

  @GET('$MoviePrefix/changes')
  Future<ChangeList> getMovieChanges(
      @Path(MovieId) int movieId,
      @Query('start_date') String? startDate,
      @Query('end_date') String? endDate,
      @Query(Page) int? page);

  @GET('$MoviePrefix/credits')
  Future<CreditList> getMovieCredit(
    @Path(MovieId) int movieId,
  );

  @GET('$MoviePrefix/external_ids')
  Future<ExternalId> getMovieExternalId(
    @Path(MovieId) int movieId,
  );

  @GET('$MoviePrefix/images')
  Future<MediaImageList> getMovieImage(
    @Path(MovieId) int movieId,
  );

  @GET('$MoviePrefix/keywords')
  Future<IDResult<MediaKeyword>> getMovieKeyword(
    @Path(MovieId) int movieId,
  );

  @GET('$MoviePrefix/lists')
  Future<PageResult<MovieList>> getMovieBelongList(
    @Path(MovieId) int movieId,
    @Query(Page) int? page,
  );

  @GET('$MoviePrefix/recommendations')
  Future<PageResult<Movie>> getMovieRecommendation(
    @Path(MovieId) int movieId,
    @Query(Page) int? page,
  );

  @GET('$MoviePrefix/release_dates')
  Future<IDResult<ReleaseDateWithCountry>> getMovieReleaseDate(
    @Path(MovieId) int movieId,
  );

  @GET('$MoviePrefix/reviews')
  Future<PageResult<Review>> getMovieReview(
    @Path(MovieId) int movieId,
    @Query(Page) int? page,
  );

  @GET('$MoviePrefix/similar')
  Future<PageResult<Movie>> getSimilarMovie(
    @Path(MovieId) int movieId,
    @Query(Page) int? page,
  );

  @GET('$MoviePrefix/translations')
  Future<TranslationList> getMovieTranslation(
    @Path(MovieId) int movieId,
  );

  @GET('$MoviePrefix/videos')
  Future<IDResult<MediaVideo>> getMovieVideo(
    @Path(MovieId) int movieId,
  );

  @GET('$MoviePrefix/watch/providers')
  Future<WatchProviderList> getMovieWatchProvider(
    @Path(MovieId) int movieId,
  );

  @POST('$MoviePrefix/rating')
  Future<CodeResponse> rateMovie(
    @Path(MovieId) int movieId,
    @Body() RateContent content,
  );

  @DELETE('$MoviePrefix/rating')
  Future<CodeResponse> deleteMovieRate(
    @Path(MovieId) int movieId,
  );

  @GET('/movie/latest')
  Future<Movie> getLatestMovie();

  @GET('/movie/now_playing')
  Future<PageResult<Movie>> getNowPlayingMovie(
    @Query(Page) int? page,
    @Query('region') String? region,
  );

  @GET('/movie/popular')
  Future<PageResult<Movie>> getPopularMovie(
    @Query(Page) int? page,
    @Query('region') String? region,
  );

  @GET('/movie/top_rated')
  Future<PageResult<Movie>> getTopRatedMovie(
    @Query(Page) int? page,
    @Query('region') String? region,
  );

  @GET('/movie/upcoming')
  Future<PageResult<Movie>> getUpcomingMovie(
    @Query(Page) int? page,
    @Query('region') String? region,
  );
}
