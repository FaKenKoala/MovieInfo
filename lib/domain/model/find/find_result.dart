import 'package:json_annotation/json_annotation.dart';
import 'package:movie_info/domain/model/movie/movie.dart';
import 'package:movie_info/domain/model/person/cast.dart';
import 'package:movie_info/domain/model/tv/tv.dart';

part 'find_result.g.dart';

@JsonSerializable()
class FindResult {
  final List<Movie> movieResults;
  final List<Cast> personResults;
  final List<TV> tvResults;
  final List<TV> tvEpisodeResults;
  final List<TV> tvSeasonResults;

  FindResult({
    this.movieResults = const [],
    this.personResults = const [],
    this.tvResults = const [],
    this.tvEpisodeResults = const [],
    this.tvSeasonResults = const [],
  });

  factory FindResult.fromJson(Map<String, dynamic> json) =>
      _$FindResultFromJson(json);
  Map<String, dynamic> toJson() => _$FindResultToJson(this);
}
