import 'package:json_annotation/json_annotation.dart';

part 'crew.g.dart';

@JsonSerializable()
class Crew {
  Crew({
    this.adult = false,
    this.backdropPath = '',
    this.creditId = '',
    this.department = '',
    this.episodeCount = 0,
    this.firstAirDate ,
    this.genreIds = const [],
    this.id = 0,
    this.job = '',
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
  });

  final bool adult;
  final String backdropPath;
  final String creditId;
  final String department;
  final int episodeCount;
  final DateTime? firstAirDate;
  final List<int> genreIds;
  final int id;
  final String job;
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

  factory Crew.fromJson(Map<String, dynamic> json) => _$CrewFromJson(json);
  Map<String, dynamic> toJson() => _$CrewToJson(this);
}
