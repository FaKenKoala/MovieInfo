import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'episode.g.dart';

@JsonSerializable()
class Episode {
  Episode({
    this.airDate,
    this.episodeNumber = 0,
    this.id = 0,
    this.name = '',
    this.overview = '',
    this.productionCode = '',
    this.seasonNumber = 0,
    this.showId = 0,
    this.stillPath = '',
    this.voteAverage = 0.0,
    this.voteCount = 0,
    this.order = 0,
  });

  final DateTime? airDate;
  final int episodeNumber;
  final int id;
  final String name;
  final String overview;
  final String productionCode;
  final int seasonNumber;
  final int showId;
  final String stillPath;
  final double voteAverage;
  final int voteCount;
  final int order;

  factory Episode.fromJson(Map<String, dynamic> json) =>
      _$EpisodeFromJson(json);
  Map<String, dynamic> toJson() => _$EpisodeToJson(this);

  @override
  String toString() {
    return json.encode(toJson());
  }
}
