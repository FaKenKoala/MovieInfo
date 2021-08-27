part of '../remote_repository.dart';

const TVId = 'tv_id';
const TVPrefix = '/tv/{$TVId}';

mixin TVRepository {
  @GET('$TVPrefix')
  Future<TV> getTVDetail(@Path(TVId) int tvId,
      @Query('append_to_response') String? appendToResponse);

  @GET('$TVPrefix/account_states')
  Future<AccountState> getTVAccountState(@Path(TVId) int tvId);
}
