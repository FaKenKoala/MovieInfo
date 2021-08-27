import 'package:json_annotation/json_annotation.dart';

part 'collection.g.dart';

@JsonSerializable()
class Collection {
  final int id;
  final String name;
  final String posterPath;
  final String backdropPath;
  final List<CollectionPart> part;
  Collection({
    this.id = 0,
    this.name = '',
    this.posterPath = '',
    this.backdropPath = '',
    this.part = const [],
  });

  factory Collection.fromJson(Map<String, dynamic> json) =>
      _$CollectionFromJson(json);
  Map<String, dynamic> toJson() => _$CollectionToJson(this);
}

@JsonSerializable()
class CollectionPart {
  CollectionPart({
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
    this.voteAverage = 0.0,
    this.voteCount = 0,
  });

  final bool adult;
  final String backdropPath;
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
  final double voteAverage;
  final int voteCount;

  factory CollectionPart.fromJson(Map<String, dynamic> json) =>
      _$CollectionPartFromJson(json);
  Map<String, dynamic> toJson() => _$CollectionPartToJson(this);
}
