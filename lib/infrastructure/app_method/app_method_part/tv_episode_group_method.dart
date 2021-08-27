import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_info/infrastructure/app_method/app_method.dart';
part 'tv_episode_group_method.freezed.dart';

@freezed
class TVEpisodeGroupMethod with _$TVEpisodeGroupMethod implements AppMethod {
  const factory TVEpisodeGroupMethod.getTVEpisodeGroupDetail({
    required String id,
  }) = GetTVEpisodeGroupDetail;
}
