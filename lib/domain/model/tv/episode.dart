import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:movie_info/domain/model/person/cast.dart';

part 'episode.g.dart';

@JsonSerializable()
class TVEpisode {
  TVEpisode({
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
    this.crew = const [],
    this.guestStars = const [],
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
  final num voteAverage;
  final int voteCount;
  final int order;

  final List<CastCrew> crew;
  final List<CastCrew> guestStars;

  factory TVEpisode.fromJson(Map<String, dynamic> json) =>
      _$TVEpisodeFromJson(json);
  Map<String, dynamic> toJson() => _$TVEpisodeToJson(this);

  @override
  String toString() {
    return json.encode(toJson());
  }
}
