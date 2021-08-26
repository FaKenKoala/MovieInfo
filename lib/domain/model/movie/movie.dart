import 'package:json_annotation/json_annotation.dart';
import 'package:movie_info/domain/model/company/company.dart';
import 'package:movie_info/domain/model/country/country.dart';
import 'package:movie_info/domain/model/enum_values/media_type.dart';
import 'package:movie_info/domain/model/genre/genre.dart';
import 'package:movie_info/domain/model/language/language.dart';
part 'movie.g.dart';

@JsonSerializable()
class Movie {
  bool adult;
  String backdropPath;
  List<int> genreIds;
  int id;
  String originalLanguage;

  String originalTitle;

  String overview;

  String posterPath;
  double popularity;
  DateTime? releaseDate;

  String title;

  bool video;

  double voteAverage;

  int voteCount;

  MediaType mediaType;

  dynamic belongsToCollection;
  int budget;
  List<Genre> genres;
  String homepage;
  String imdbId;
  List<Company> productionCompanies;
  List<Country> productionCountries;
  int revenue;
  int runtime;
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
    return '${this.toJson()}';
  }
}
