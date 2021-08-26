import 'package:freezed_annotation/freezed_annotation.dart';
part 'tv.g.dart';

@JsonSerializable()
class Tv {
  DateTime? firstAirDate;
  List<int> genreIds;
  String originalLanguage;
  int id;
  String posterPath;
  double voteAverage;
  String originalName;
  List<String> originCountry;
  String name;
  int voteCount;
  String overview;
  String backdropPath;
  double popularity;
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
