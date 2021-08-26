import 'package:json_annotation/json_annotation.dart';

part 'recommendation.g.dart';

@JsonSerializable()
class Recommendation {
  Recommendation({
    this.adult = false,
    this.backdropPath = '',
    this.genreIds = const [],
    this.id = 0,
    this.originalLanguage = '',
    this.originalTitle = '',
    this.overview = '',
    this.releaseDate,
    this.posterPath = '',
    this.popularity = 0.0,
    this.title = '',
    this.video = false,
    this.voteAverage = 0,
    this.voteCount = 0,
  });

  final bool adult;
  final dynamic backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final DateTime? releaseDate;
  final String posterPath;
  final double popularity;
  final String title;
  final bool video;
  final int voteAverage;
  final int voteCount;

  factory Recommendation.fromJson(Map<String, dynamic> json) =>
      _$RecommendationFromJson(json);
  Map<String, dynamic> toJson() => _$RecommendationToJson(this);
}
