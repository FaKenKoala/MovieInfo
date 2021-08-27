import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:movie_info/domain/model/network/network.dart';

part 'episode_group.g.dart';

@JsonSerializable()
class EpisodeGroup {
  EpisodeGroup({
    this.description = '',
    this.episodeCount = 0,
    this.groupCount = 0,
    this.id = '',
    this.name = '',
    this.network,
    this.type = 0,
  });

  final String description;
  final int episodeCount;
  final int groupCount;
  final String id;
  final String name;
  final Network? network;
  final int type;

  factory EpisodeGroup.fromJson(Map<String, dynamic> json) =>
      _$EpisodeGroupFromJson(json);
  Map<String, dynamic> toJson() => _$EpisodeGroupToJson(this);
  @override
  String toString() {
    return json.encode(toJson());
  }
}
