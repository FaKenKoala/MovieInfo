import 'package:json_annotation/json_annotation.dart';

part 'movie_list.g.dart';

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
