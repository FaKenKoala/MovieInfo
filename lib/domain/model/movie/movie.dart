import 'package:json_annotation/json_annotation.dart';
import 'package:movie_info/domain/model/enum_values/media_type.dart';
part 'movie.g.dart';

@JsonSerializable(explicitToJson: true)
class Movie {
  int id;
  bool video;
  @JsonKey(name: 'vote_count')
  int voteCount;
  @JsonKey(name: 'vote_average')
  double voteAverage;
  String title;
  @JsonKey(name: 'release_date')
  String releaseDate;
  @JsonKey(name: 'original_language')
  String originalLanguage;
  @JsonKey(name: 'original_title')
  String originalTitle;
  @JsonKey(name: 'genre_ids')
  List<int> genreIds;
  @JsonKey(name: 'backdrop_path')
  String backdropPath;
  bool adult;
  String overview;
  @JsonKey(name: 'poster_path')
  String posterPath;
  double popularity;
  @JsonKey(name: 'media_type')
  MediaType mediaType;

  Movie({
    this.id = 0,
    this.video = true,
    this.voteCount = 0,
    this.voteAverage = 0.0,
    this.title = '',
    this.releaseDate = '',
    this.originalLanguage = '',
    this.originalTitle = '',
    this.genreIds = const <int>[],
    this.backdropPath = '',
    this.adult = false,
    this.overview = '',
    this.posterPath = '',
    this.popularity = 0,
    this.mediaType = MediaType.ALL,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);

  @override
  String toString() {
    return '${this.toJson()}';
  }
}
