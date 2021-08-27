import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:movie_info/domain/model/genre/genre.dart';

part 'genre_list.g.dart';

@JsonSerializable()
class GenreList {
  final List<Genre> genres;
  GenreList({
    this.genres = const [],
  });

  factory GenreList.fromJson(Map<String, dynamic> json) =>
      _$GenreListFromJson(json);
  Map<String, dynamic> toJson() => _$GenreListToJson(this);

  @override
  String toString() {
    return json.encode(toJson());
  }
}
