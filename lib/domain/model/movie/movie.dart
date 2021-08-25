import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:movie_info/domain/model/company/company.dart';
import 'package:movie_info/domain/model/country/country.dart';
import 'package:movie_info/domain/model/enum_values/media_type.dart';
import 'package:movie_info/domain/model/genre/genre.dart';
import 'package:movie_info/domain/model/language/language.dart';
import 'package:movie_info/infrastructure/util/constant.dart';
part 'movie.g.dart';

@JsonSerializable(explicitToJson: true)
class Movie {
  bool adult;
  @JsonKey(name: 'backdrop_path')
  String backdropPath;
  @JsonKey(name: 'genre_ids')
  List<int> genreIds;
  int id;
  @JsonKey(name: 'original_language')
  String originalLanguage;

  @JsonKey(name: 'original_title')
  String originalTitle;

  String overview;

  @JsonKey(name: 'poster_path')
  String posterPath;
  double popularity;
  @JsonKey(name: 'release_date')
  DateTime? releaseDate;

  String title;

  bool video;

  @JsonKey(name: 'vote_average')
  double voteAverage;

  @JsonKey(name: 'vote_count')
  int voteCount;

  @JsonKey(name: 'media_type')
  MediaType mediaType;

  dynamic belongsToCollection;
  int budget;
  List<Genre> genres;
  String homepage;
  @JsonKey(name: 'imdb_id')
  String imdbId;
  @JsonKey(name: 'production_companies')
  List<Company> productionCompanies;
  @JsonKey(name: 'production_countries')
  List<Country> productionCountries;
  int revenue;
  int runtime;
  @JsonKey(name: 'spoken_languages')
  List<Language> spokenLanguages;
  String status;
  String tagline;

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
    required this.mediaType,
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
    return '${this.toJson()}';
  }
}
