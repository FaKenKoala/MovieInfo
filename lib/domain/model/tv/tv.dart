import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_info/domain/model/country/country.dart';
import 'package:movie_info/domain/model/enum_values/enum_values.dart';
import 'package:movie_info/domain/model/genre/genre.dart';
import 'package:movie_info/domain/model/language/language.dart';
import 'package:movie_info/domain/model/network/network.dart';
import 'package:movie_info/domain/model/person/person.dart';
import 'package:movie_info/domain/model/tv/season.dart';

import 'episode.dart';
part 'tv.g.dart';

@JsonSerializable()
class TV {
  final DateTime? firstAirDate;
  final List<int> genreIds;
  final String originalLanguage;
  final int id;
  final String posterPath;
  final double voteAverage;
  final String originalName;
  final List<String> originCountry;
  final String name;
  final int voteCount;
  final String overview;
  final String backdropPath;
  final double popularity;
  final MediaType mediaType;

  final List<Person> createdBy;
  final List<int> episodeRunTime;
  final List<Genre> genres;
  final String homepage;
  final bool inProduction;
  final List<String> languages;
  final DateTime? lastAirDate;
  final Episode? lastEpisodeToAir;
  final Episode? nextEpisodeToAir;
  final List<Network> networks;
  final int numberOfEpisodes;
  final int numberOfSeasons;
  final List<Network> productionCompanies;
  final List<Country> productionCountries;
  final List<Season> seasons;
  final List<Language> spokenLanguages;
  final String status;
  final String tagline;
  final String type;

  TV({
    this.createdBy = const [],
    this.episodeRunTime = const [],
    this.genres = const [],
    this.homepage = '',
    this.inProduction = false,
    this.languages = const [],
    this.lastAirDate,
    this.lastEpisodeToAir,
    this.nextEpisodeToAir,
    this.networks = const [],
    this.numberOfEpisodes = 0,
    this.numberOfSeasons = 0,
    this.productionCompanies = const [],
    this.productionCountries = const [],
    this.seasons = const [],
    this.spokenLanguages = const [],
    this.status = '',
    this.tagline = '',
    this.type = '',
    this.firstAirDate,
    this.genreIds = const [],
    this.originalLanguage = '',
    this.id = 0,
    this.posterPath = '',
    this.voteAverage = 0.0,
    this.originalName = '',
    this.originCountry = const [],
    this.name = '',
    this.voteCount = 0,
    this.overview = '',
    this.backdropPath = '',
    this.popularity = 0.0,
    this.mediaType = MediaType.TV,
  });

  factory TV.fromJson(Map<String, dynamic> json) => _$TVFromJson(json);

  Map<String, dynamic> toJson() => _$TVToJson(this);

  @override
  String toString() {
    return json.encode(toJson());
  }
}
