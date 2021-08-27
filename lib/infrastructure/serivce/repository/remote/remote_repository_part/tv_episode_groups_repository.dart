part of '../remote_repository.dart';

mixin TVEpisodeGroupsRepository {
  @GET('/tv/episode_group/{id}')
  Future<EpisodeGroup> getTVEpisodeGroupDetail(
    @Path('id') String id,
  );
}
