import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'collection.g.dart';

@JsonSerializable()
class CollectionList {
  final int id;
  final String name;
  final String posterPath;
  final String backdropPath;
  final List<Collection> part;
  CollectionList({
    this.id = 0,
    this.name = '',
    this.posterPath = '',
    this.backdropPath = '',
    this.part = const [],
  });

  factory CollectionList.fromJson(Map<String, dynamic> json) =>
      _$CollectionListFromJson(json);
  Map<String, dynamic> toJson() => _$CollectionListToJson(this);

  @override
  String toString() {
    return json.encode(toJson());
  }
}

@JsonSerializable()
class Collection {
  Collection({
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
    this.name = '',
    this.originalName = '',
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
  final num popularity;
  final String title;
  final bool video;
  final num voteAverage;
  final int voteCount;
  final String name;
  final String originalName;

  factory Collection.fromJson(Map<String, dynamic> json) =>
      _$CollectionFromJson(json);
  Map<String, dynamic> toJson() => _$CollectionToJson(this);

  @override
  String toString() {
    return json.encode(toJson());
  }
}
