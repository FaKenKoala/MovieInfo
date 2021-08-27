part of '../remote_repository.dart';

const TVId = 'tv_id';
const TVPrefix = '/tv/{$TVId}';

mixin TVRepository {
  @GET('$TVPrefix')
  Future<TV> getTVDetail(
    @Path(TVId) int tvId,
  );

  @GET('$TVPrefix/account_states')
  Future<AccountState> getTVAccountState(@Path(TVId) int tvId);

  @GET('$TVPrefix/aggregate_credits')
  Future<CreditList> getTVAggregateCredit(@Path(TVId) int tvId);

  @GET('$TVPrefix/alternative_titles')
  Future<IDResult<Title>> getTVAlternativeTitles(
    @Path(TVId) int tvId,
  );

  @GET('$TVPrefix/changes')
  Future<ChangeList> getTVChanges(
      @Path(TVId) int tvId,
      @Query('start_date') String? startDate,
      @Query('end_date') String? endDate,
      @Query(Page) int? page);

  @GET('$TVPrefix/content_ratings')
  Future<IDResult<ContentRating>> getTVContentRating(
    @Path(TVId) int tvId,
  );

  @GET('$TVPrefix/credits')
  Future<CreditList> getTVCredit(
    @Path(TVId) int tvId,
  );

  @GET('$TVPrefix/episode_groups')
  Future<IDResult<EpisodeGroup>> getTVEpisodeGroups(
    @Path(TVId) int tvId,
  );

  @GET('$TVPrefix/external_ids')
  Future<ExternalId> getTVExternalId(
    @Path(TVId) int tvId,
  );

  @GET('$TVPrefix/images')
  Future<MediaImageList> getTVImage(
    @Path(TVId) int tvId,
  );

  @GET('$TVPrefix/keywords')
  Future<IDResult<MediaKeyword>> getTVKeyword(
    @Path(TVId) int tvId,
  );

  @GET('$TVPrefix/recommendations')
  Future<PageResult<TV>> getTVRecommendation(
    @Path(TVId) int tvId,
    @Query(Page) int? page,
  );

  @GET('$TVPrefix/reviews')
  Future<PageResult<Review>> getTVReview(
    @Path(TVId) int tvId,
    @Query(Page) int? page,
  );

  @GET('$TVPrefix/screened_theatrically')
  Future<IDResult<Episode>> getTVScreenedTheatrically(
    @Path(TVId) int tvId,
  );

  @GET('$TVPrefix/similar')
  Future<PageResult<TV>> getSimilarTV(
    @Path(TVId) int tvId,
    @Query(Page) int? page,
  );

  @GET('$TVPrefix/translations')
  Future<TranslationList> getTVTranslation(
    @Path(TVId) int tvId,
  );

  @GET('$TVPrefix/videos')
  Future<IDResult<MediaVideo>> getTVVideo(
    @Path(TVId) int tvId,
  );

  @GET('$TVPrefix/watch/providers')
  Future<WatchProviderList> getTVWatchProvider(
    @Path(TVId) int tvId,
  );

  @POST('$TVPrefix/rating')
  Future<CodeResponse> rateTV(
    @Path(TVId) int tvId,
    @Body() RateContent content,
  );

  @DELETE('$TVPrefix/rating')
  Future<CodeResponse> deleteTVRate(
    @Path(TVId) int tvId,
  );

  @GET('/tv/latest')
  Future<TV> getLatestTV();

  @GET('/tv/airing_today')
  Future<PageResult<TV>> getAiringTodayTV(
    @Query(Page) int? page,
  );

  @GET('/tv/on_the_air')
  Future<PageResult<TV>> getOnTheAirTV(
    @Query(Page) int? page,
  );

  @GET('/tv/popular')
  Future<PageResult<TV>> getPopularTV(
    @Query(Page) int? page,
  );

  @GET('/tv/top_rated')
  Future<PageResult<TV>> getTopRatedTV(
    @Query(Page) int? page,
  );
}
