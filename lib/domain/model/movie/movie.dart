import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:movie_info/domain/model/company/company.dart';
import 'package:movie_info/domain/model/country/country.dart';
import 'package:movie_info/domain/model/enum_values/media_type.dart';
import 'package:movie_info/domain/model/genre/genre.dart';
import 'package:movie_info/domain/model/language/language.dart';
part 'movie.g.dart';

@JsonSerializable()
class Movie extends MediaTypeBase {
  final bool adult;
  final String? backdropPath;
  final MovieCollectionInfo? belongsToCollection;
  final int budget;
  final List<int> genreIds;
  final List<Genre> genres;
  final String? homepage;
  final int id;
  final String imdbId;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String? posterPath;
  final List<Company> productionCompanies;
  final List<Country> productionCountries;
  final String? releaseDate;
  final int revenue;
  final int runtime;
  final List<Language> spokenLanguages;
  final String status;
  final String tagline;
  final String title;
  final bool video;
  final num? voteAverage;
  final int voteCount;
  final MediaType mediaType;

  Movie({
    this.adult = false,
    this.backdropPath,
    this.belongsToCollection,
    this.budget = 0,
    this.genreIds = const <int>[],
    this.genres = const [],
    this.homepage,
    this.id = 0,
    this.imdbId = '',
    this.mediaType = MediaType.MOVIE,
    this.originalLanguage = '',
    this.originalTitle = '',
    this.overview = '',
    this.popularity = 0,
    this.posterPath = '',
    this.productionCompanies = const [],
    this.productionCountries = const [],
    this.releaseDate,
    this.revenue = 0,
    this.runtime = 0,
    this.spokenLanguages = const [],
    this.status = '',
    this.tagline = '',
    this.title = '',
    this.video = true,
    this.voteAverage,
    this.voteCount = 0,
  }) : super(mediaType);

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);

  @override
  String toString() {
    return json.encode(toJson());
  }
}

@JsonSerializable()
class MovieCollectionInfo {
  final int id;
  final String name;
  final String? posterPath;
  final String? backdropPath;
  MovieCollectionInfo({
    this.id = 0,
    this.name = '',
    this.posterPath,
    this.backdropPath,
  });

  factory MovieCollectionInfo.fromJson(Map<String, dynamic> json) =>
      _$MovieCollectionInfoFromJson(json);
  Map<String, dynamic> toJson() => _$MovieCollectionInfoToJson(this);

  @override
  String toString() {
    return json.encode(toJson());
  }
}
