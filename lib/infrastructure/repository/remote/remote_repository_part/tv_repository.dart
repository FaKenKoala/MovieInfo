part of '../remote_repository.dart';

const CTVId = 'tv_id';
const TVPrefix = '/tv/{$CTVId}';

mixin TVRepository {
  @GET('$TVPrefix')
  Future<TV> getTVDetail(
    @Path(CTVId) int tvId,
  );

  @GET('$TVPrefix/$CAccountStates')
  Future<AccountState> getTVAccountState(@Path(CTVId) int tvId);

  @GET('$TVPrefix/$CAggregateCredits')
  Future<CreditList> getTVAggregateCredit(@Path(CTVId) int tvId);

  @GET('$TVPrefix/alternative_titles')
  Future<IDResult<Title>> getTVAlternativeTitles(
    @Path(CTVId) int tvId,
  );

  @GET('$TVPrefix/$CChanges')
  Future<ChangeList> getTVChanges(
      @Path(CTVId) int tvId,
      @Query('start_date') String? startDate,
      @Query('end_date') String? endDate,
      @Query(Page) int? page);

  @GET('$TVPrefix/content_ratings')
  Future<IDResult<ContentRating>> getTVContentRating(
    @Path(CTVId) int tvId,
  );

  @GET('$TVPrefix/$CCredits')
  Future<CreditList> getTVCredit(
    @Path(CTVId) int tvId,
  );

  @GET('$TVPrefix/episode_groups')
  Future<IDResult<EpisodeGroup>> getTVEpisodeGroups(
    @Path(CTVId) int tvId,
  );

  @GET('$TVPrefix/$CExternalIds')
  Future<ExternalId> getTVExternalId(
    @Path(CTVId) int tvId,
  );

  @GET('$TVPrefix/$CImages')
  Future<MediaImageList> getTVImage(
    @Path(CTVId) int tvId,
  );

  @GET('$TVPrefix/keywords')
  Future<IDResult<MediaKeyword>> getTVKeyword(
    @Path(CTVId) int tvId,
  );

  @GET('$TVPrefix/recommendations')
  Future<PageResult<TV>> getTVRecommendation(
    @Path(CTVId) int tvId,
    @Query(Page) int? page,
  );

  @GET('$TVPrefix/reviews')
  Future<PageResult<Review>> getTVReview(
    @Path(CTVId) int tvId,
    @Query(Page) int? page,
  );

  @GET('$TVPrefix/screened_theatrically')
  Future<IDResult<TVEpisode>> getTVScreenedTheatrically(
    @Path(CTVId) int tvId,
  );

  @GET('$TVPrefix/similar')
  Future<PageResult<TV>> getSimilarTV(
    @Path(CTVId) int tvId,
    @Query(Page) int? page,
  );

  @GET('$TVPrefix/$CTranslations')
  Future<TranslationList> getTVTranslation(
    @Path(CTVId) int tvId,
  );

  @GET('$TVPrefix/$CVideos')
  Future<IDResult<MediaVideo>> getTVVideo(
    @Path(CTVId) int tvId,
  );

  @GET('$TVPrefix/watch/providers')
  Future<WatchProviderList> getTVWatchProvider(
    @Path(CTVId) int tvId,
  );

  @POST('$TVPrefix/$CRating')
  Future<CodeResponse> rateTV(
    @Path(CTVId) int tvId,
    @Body() RateContent content,
  );

  @DELETE('$TVPrefix/$CRating')
  Future<CodeResponse> deleteTVRate(
    @Path(CTVId) int tvId,
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
