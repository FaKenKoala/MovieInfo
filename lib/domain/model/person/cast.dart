import 'package:json_annotation/json_annotation.dart';

part 'cast.g.dart';

@JsonSerializable()
class CastCrew {
  CastCrew({
    this.adult = false,
    this.backdropPath = '',
    this.character = '',
    this.creditId = '',
    this.episodeCount = 0,
    this.firstAirDate,
    this.genreIds = const [],
    this.id = 0,
    this.mediaType = '',
    this.name = '',
    this.originCountry = const [],
    this.originalLanguage = '',
    this.originalName = '',
    this.originalTitle = '',
    this.overview = '',
    this.popularity = 0,
    this.posterPath = '',
    this.releaseDate,
    this.title = '',
    this.video = false,
    this.voteAverage = 0,
    this.voteCount = 0,
    this.order = 0,
    this.department = '',
    this.job = '',
  });

  final bool adult;
  final String backdropPath;
  final String character;
  final String creditId;
  final int episodeCount;
  final DateTime? firstAirDate;
  final List<int> genreIds;
  final int id;
  final String mediaType;
  final String name;
  final List<String> originCountry;
  final String originalLanguage;
  final String originalName;
  final String originalTitle;
  final String overview;
  final num popularity;
  final String posterPath;
  final DateTime? releaseDate;
  final String title;
  final bool video;
  final num voteAverage;
  final int voteCount;

  final int order;

  final String department;
  final String job;

  factory CastCrew.fromJson(Map<String, dynamic> json) => _$CastCrewFromJson(json);
  Map<String, dynamic> toJson() => _$CastCrewToJson(this);
}
