import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:movie_info/domain/model/tv/episode.dart';

part 'episode_group_item.g.dart';

@JsonSerializable()
class EpisodeGroupItem {
  final String id;
  final String name;
  final int order;
  final List<Episode> episodes;
  final bool locked;
  EpisodeGroupItem({
    this.id = '',
    this.name = '',
    this.order = 0,
    this.episodes = const [],
    this.locked = false,
  });

  factory EpisodeGroupItem.fromJson(Map<String, dynamic> json) =>
      _$EpisodeGroupItemFromJson(json);
  Map<String, dynamic> toJson() => _$EpisodeGroupItemToJson(this);
  @override
  @override
  String toString() {
    return json.encode(toJson());
  }
}
