import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:movie_info/domain/model/collection/collection.dart';
import 'package:movie_info/domain/model/company/company.dart';
import 'package:movie_info/domain/model/country/country.dart';
import 'package:movie_info/domain/model/enum_values/media_type.dart';
import 'package:movie_info/domain/model/genre/genre.dart';
import 'package:movie_info/domain/model/language/language.dart';
part 'movie.g.dart';

@JsonSerializable()
class MovieList {
  MovieList({
    this.description = '',
    this.favoriteCount = 0,
    this.id = 0,
    this.itemCount = 0,
    this.iso6391 = '',
    this.listType = '',
    this.name = '',
    this.posterPath = '',
  });

  final String description;
  final int favoriteCount;
  final int id;
  final int itemCount;
  @JsonKey(name: 'iso_639_1')
  final String iso6391;
  final String listType;
  final String name;
  final String posterPath;

  factory MovieList.fromJson(Map<String, dynamic> json) =>
      _$MovieListFromJson(json);
  Map<String, dynamic> toJson() => _$MovieListToJson(this);
}

@JsonSerializable()
class Movie extends MediaTypeBase{
  final bool adult;
  final String? backdropPath;
  final Collection? belongsToCollection;
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
  final double voteAverage;
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
    this.voteAverage = 0.0,
    this.voteCount = 0,
  }):super(mediaType);

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);

  @override
  String toString() {
    return json.encode(toJson());
  }
}
