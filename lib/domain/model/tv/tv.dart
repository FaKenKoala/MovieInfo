import 'package:freezed_annotation/freezed_annotation.dart';
part 'tv.g.dart';

@JsonSerializable()
class Tv {
  @JsonKey(name: 'first_air_date')
  DateTime? firstAirDate;
  @JsonKey(name: 'genre_ids')
  List<int> genreIds;
  @JsonKey(name: 'original_language')
  String originalLanguage;
  int id;
  @JsonKey(name: 'poster_path')
  String posterPath;
  @JsonKey(name: 'vote_average')
  double voteAverage;
  @JsonKey(name: 'original_name')
  String originalName;
  @JsonKey(name: 'origin_country')
  List<String> originCountry;
  String name;
  @JsonKey(name: 'vote_count')
  int voteCount;
  String overview;
  @JsonKey(name: 'backdrop_path')
  String backdropPath;
  double popularity;
  @JsonKey(name: 'media_type')
  String mediaType;

  Tv({
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
    required this.mediaType,
  });

  factory Tv.fromJson(Map<String, dynamic> json) => _$TvFromJson(json);

  Map<String, dynamic> toJson() => _$TvToJson(this);

  @override
  String toString() {
    return '${this.toJson()}';
  }
}
