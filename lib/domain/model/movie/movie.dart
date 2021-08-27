import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:movie_info/domain/model/company/company.dart';
import 'package:movie_info/domain/model/country/country.dart';
import 'package:movie_info/domain/model/enum_values/media_type.dart';
import 'package:movie_info/domain/model/genre/genre.dart';
import 'package:movie_info/domain/model/language/language.dart';
part 'movie.g.dart';

@JsonSerializable()
class Movie {
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
  final MediaType mediaType;

  dynamic belongsToCollection;
  final int budget;
  final List<Genre> genres;
  final String homepage;
  final String imdbId;
  final List<Company> productionCompanies;
  final List<Country> productionCountries;
  final int revenue;
  final int runtime;
  final List<Language> spokenLanguages;
  final String status;
  final String tagline;

  Movie({
    this.id = 0,
    this.video = true,
    this.voteCount = 0,
    this.voteAverage = 0.0,
    this.title = '',
    this.releaseDate,
    this.originalLanguage = '',
    this.originalTitle = '',
    this.genreIds = const <int>[],
    this.backdropPath = '',
    this.adult = false,
    this.overview = '',
    this.posterPath = '',
    this.popularity = 0,
    this.mediaType = MediaType.MOVIE,
    this.belongsToCollection,
    this.budget = 0,
    this.genres = const [],
    this.homepage = '',
    this.imdbId = '',
    this.productionCompanies = const [],
    this.productionCountries = const [],
    this.revenue = 0,
    this.runtime = 0,
    this.spokenLanguages = const [],
    this.status = '',
    this.tagline = '',
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);

  @override
  String toString() {
    return json.encode(toJson());
  }
}
