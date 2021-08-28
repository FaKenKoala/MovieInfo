part of '../remote_repository.dart';

const CTVEpisodeNumber = 'episode_number';
const TVEpisodePrefix = '$TVSeasonPrefix/episode/$CTVEpisodeNumber';
const CRating = 'rating';
mixin TVEpisodeRepository {
  @GET('$TVEpisodePrefix')
  Future getTVEpisodeDetail(
    @Path('$CTVId') int tvId,
    @Path('$CTVSeasonNumber') int seasonNumber,
    @Path('$CTVEpisodeNumber') int episodeNumber,
  );

  @GET('$TVEpisodePrefix/$CAccountStates')
  Future getTVEpisodeAccountState(
    @Path('$CTVId') int tvId,
    @Path('$CTVSeasonNumber') int seasonNumber,
    @Path('$CTVEpisodeNumber') int episodeNumber,
  );

  @GET('$TVEpisodePrefix/$CChanges')
  Future getTVEpisodeChange(
    @Path('$CTVId') int tvId,
    @Path('$CTVSeasonNumber') int seasonNumber,
    @Path('$CTVEpisodeNumber') int episodeNumber,
  );

  @GET('$TVEpisodePrefix/$CCredits')
  Future getTVEpisodeCredits(
    @Path('$CTVId') int tvId,
    @Path('$CTVSeasonNumber') int seasonNumber,
    @Path('$CTVEpisodeNumber') int episodeNumber,
  );

  @GET('$TVEpisodePrefix/$CExternalIds')
  Future getTVEpisodeExternalID(
    @Path('$CTVId') int tvId,
    @Path('$CTVSeasonNumber') int seasonNumber,
    @Path('$CTVEpisodeNumber') int episodeNumber,
  );

  @GET('$TVEpisodePrefix/$CImages')
  Future getTVEpisodeImage(
    @Path('$CTVId') int tvId,
    @Path('$CTVSeasonNumber') int seasonNumber,
    @Path('$CTVEpisodeNumber') int episodeNumber,
  );

  @GET('$TVEpisodePrefix/$CTranslations')
  Future getTVEpisodeTranslations(
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
