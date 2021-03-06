import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'video.g.dart';

@JsonSerializable()
class MediaVideo {
  MediaVideo({
    this.iso6391 = '',
    this.iso31661 = '',
    this.name = '',
    this.key = '',
    this.site = '',
    this.size = 0,
    this.type = '',
    this.official = false,
    this.publishedAt,
    this.id = '',
  });

  @JsonKey(name: 'iso_639_1')
  final String iso6391;
  @JsonKey(name: 'iso_3166_1')
  final String iso31661;
  final String name;
  final String key;
  final String site;
  final int size;
  final String type;
  final bool official;
  final DateTime? publishedAt;
  final String id;

  factory MediaVideo.fromJson(Map<String, dynamic> json) => _$MediaVideoFromJson(json);
  Map<String, dynamic> toJson() => _$MediaVideoToJson(this);

  @override
  String toString() {
    return json.encode(toJson());
  }
}
