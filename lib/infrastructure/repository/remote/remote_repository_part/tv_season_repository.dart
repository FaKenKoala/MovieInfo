part of '../remote_repository.dart';

const TVSeasonPrefix = '/tv/{$CTVId}/season/{$CTVSeasonNumber}';
const CTVSeasonNumber = 'season_number';
const CAccountStates = 'account_states';
const CAggregateCredits = 'aggregate_credits';
const CChanges = 'changes';
const CCredits = 'credits';
const CExternalIds = 'external_ids';
const CImages = 'images';
const CTranslations = 'translations';
const CVideos = 'videos';

mixin TVSeasonRepository {
  @GET('$TVSeasonPrefix')
  Future<TVSeason> getTVSeasonDetail(
    @Path('$CTVId') int tvId,
    @Path('$CTVSeasonNumber') int seasonNumber,
  );

  @GET('$TVSeasonPrefix/$CAccountStates')
  Future<IDResult<AccountState>> getTVSeasonAccountState(
    @Path('$CTVId') int tvId,
    @Path('$CTVSeasonNumber') int seasonNumber,
  );

  @GET('$TVSeasonPrefix/$CAggregateCredits')
  Future<TVSeasonCreditList> getTVSeasonAggregatedCredits(
    @Path('$CTVId') int tvId,
    @Path('$CTVSeasonNumber') int seasonNumber,
  );

  @GET('/tv/season/{season_id}/$CChanges')
  Future<ChangeList> getTVSeasonChange(
    @Path('season_id') int seasonId,
  );

  @GET('$TVSeasonPrefix/$CCredits')
  Future<TVSeasonCreditList> getTVSeasonCredits(
    @Path('$CTVId') int tvId,
    @Path('$CTVSeasonNumber') int seasonNumber,
  );

  @GET('$TVSeasonPrefix/$CExternalIds')
  Future<ExternalId> getTVSeasonExternalID(
    @Path('$CTVId') int tvId,
    @Path('$CTVSeasonNumber') int seasonNumber,
  );

  @GET('$TVSeasonPrefix/$CImages')
  Future<MediaImageList> getTVSeasonImage(
    @Path('$CTVId') int tvId,
    @Path('$CTVSeasonNumber') int seasonNumber,
  );

  @GET('$TVSeasonPrefix/$CTranslations')
  Future<TranslationList> getTVSeasonTranslations(
    @Path('$CTVId') int tvId,
    @Path('$CTVSeasonNumber') int seasonNumber,
  );

  @GET('$TVSeasonPrefix/$CVideos')
  Future<IDResult<MediaVideo>> getTVSeasonVideos(
    @Path('$CTVId') int tvId,
    @Path('$CTVSeasonNumber') int seasonNumber,
  );
}
