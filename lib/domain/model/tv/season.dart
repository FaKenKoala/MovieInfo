import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'episode.dart';

part 'season.g.dart';

@JsonSerializable()
class TVSeason {
  final DateTime? airDate;
  final int episodeCount;
  final int id;
  final String name;
  final String overview;
  final String? posterPath;
  final int seasonNumber;
  final int seasonId;

  final List<TVEpisode> episodes;

  TVSeason({
    this.airDate,
    this.episodeCount = 0,
    this.id = 0,
    this.name = '',
    this.overview = '',
    this.posterPath,
    this.seasonNumber = 0,
    this.seasonId = 0,
    this.episodes = const [],
  });

  factory TVSeason.fromJson(Map<String, dynamic> json) => _$TVSeasonFromJson(json);
  Map<String, dynamic> toJson() => _$TVSeasonToJson(this);

  @override
  String toString() {
    return json.encode(toJson());
  }
}
