import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_info/domain/model/enum_values/enum_values.dart';
part 'tv.g.dart';

@JsonSerializable()
class TV {
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
  MediaType mediaType;

  TV({
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
    return '${this.toJson()}';
  }
}
