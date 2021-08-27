part of '../remote_repository.dart';

const TVId = 'tv_id';
const TVPrefix = '/tv/{$TVId}';

mixin TVRepository {
  @GET('$TVPrefix')
  Future<TV> getTVDetail(@Path(TVId) int tvId,
      @Query('append_to_response') String? appendToResponse);

  @GET('$TVPrefix/account_states')
  Future<AccountState> getTVAccountState(@Path(TVId) int tvId);

  @GET('$TVPrefix/aggregate_credits')
  Future<MediaCredit> getTVAggregateCredit(@Path(TVId) int tvId);

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
}
