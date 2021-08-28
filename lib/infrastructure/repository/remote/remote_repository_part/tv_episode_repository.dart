part of '../remote_repository.dart';

const CTVEpisodeNumber = 'episode_number';
const TVEpisodePrefix = '$TVSeasonPrefix/episode/{$CTVEpisodeNumber}';
const CRating = 'rating';
mixin TVEpisodeRepository {
  @GET('$TVEpisodePrefix')
  Future<TVEpisode> getTVEpisodeDetail(
    @Path('$CTVId') int tvId,
    @Path('$CTVSeasonNumber') int seasonNumber,
    @Path('$CTVEpisodeNumber') int episodeNumber,
  );

  @GET('$TVEpisodePrefix/$CAccountStates')
  Future<AccountState> getTVEpisodeAccountState(
    @Path('$CTVId') int tvId,
    @Path('$CTVSeasonNumber') int seasonNumber,
    @Path('$CTVEpisodeNumber') int episodeNumber,
  );

  @GET('/tv/episode/{episode_id}/changes')
  Future<ChangeList> getTVEpisodeChange(
    @Path('episode_id') int episodeId,
    @Query('start_date') String? startDate,
    @Query('end_date') String? endDate,
    @Query('page') int? page,
  );

  @GET('$TVEpisodePrefix/$CCredits')
  Future<TVCreditList> getTVEpisodeCredits(
    @Path('$CTVId') int tvId,
    @Path('$CTVSeasonNumber') int seasonNumber,
    @Path('$CTVEpisodeNumber') int episodeNumber,
  );

  @GET('$TVEpisodePrefix/$CExternalIds')
  Future<ExternalId> getTVEpisodeExternalID(
    @Path('$CTVId') int tvId,
    @Path('$CTVSeasonNumber') int seasonNumber,
    @Path('$CTVEpisodeNumber') int episodeNumber,
  );

  @GET('$TVEpisodePrefix/$CImages')
  Future<MediaImageList> getTVEpisodeImage(
    @Path('$CTVId') int tvId,
    @Path('$CTVSeasonNumber') int seasonNumber,
    @Path('$CTVEpisodeNumber') int episodeNumber,
  );

  @GET('$TVEpisodePrefix/$CTranslations')
  Future<TranslationList> getTVEpisodeTranslations(
    @Path('$CTVId') int tvId,
    @Path('$CTVSeasonNumber') int seasonNumber,
    @Path('$CTVEpisodeNumber') int episodeNumber,
  );

  @GET('$TVEpisodePrefix/$CVideos')
  Future getTVEpisodeVideo(
    @Path('$CTVId') int tvId,
    @Path('$CTVSeasonNumber') int seasonNumber,
    @Path('$CTVEpisodeNumber') int episodeNumber,
  );

  @POST('$TVEpisodePrefix/$CRating')
  Future rateTVEpisode(
    @Path('$CTVId') int tvId,
    @Path('$CTVSeasonNumber') int seasonNumber,
    @Path('$CTVEpisodeNumber') int episodeNumber,
    @Body() RateContent rateContent,
  );

  @DELETE('$TVEpisodePrefix/$CRating')
  Future deleteRateTVEpisode(
    @Path('$CTVId') int tvId,
    @Path('$CTVSeasonNumber') int seasonNumber,
    @Path('$CTVEpisodeNumber') int episodeNumber,
  );
}
