import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:movie_info/domain/model/enum_values/enum_values.dart';

part '../media/media_list.g.dart';

@JsonSerializable()
class MediaList {
  MediaList({
    this.description = '',
    this.favoriteCount = 0,
    this.id = 0,
    this.itemCount = 0,
    this.iso6391 = '',
    this.listType = '',
    this.name = '',
    this.posterPath = '',
    this.items = const [],
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
  final List<MediaTypeBase> items;

  factory MediaList.fromJson(Map<String, dynamic> json) =>
      _$MediaListFromJson(json);
  Map<String, dynamic> toJson() => _$MediaListToJson(this);

  @override
  String toString() {
    return json.encode(toJson());
  }
}
