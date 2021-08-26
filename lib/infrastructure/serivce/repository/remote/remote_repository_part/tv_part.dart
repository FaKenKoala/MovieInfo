part of '../remote_repository.dart';

const TVId = 'tv_id';
const TVPrefix = '/tv/{$TVId}';

mixin TVPart {
  @GET('$TVPrefix')
  Future<TV> getTVDetail(
      {@Path(TVId) required int tvId,
      @Query(Language) required String? language,
      @Query('append_to_response') required String? appendToResponse});
}
