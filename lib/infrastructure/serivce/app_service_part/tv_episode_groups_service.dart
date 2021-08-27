part of '../app_service.dart';

mixin TVEpisodeGroupService on AppServicePart{
  get getTVEpisodeGroupDetail => remoteRepository.getTVEpisodeGroupDetail;
}
