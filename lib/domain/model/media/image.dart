import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable()
class MediaImageList {
  final int id;
  final List<MediaImageItem> backdrops;
  final List<MediaImageItem> logos;
  final List<MediaImageItem> posters;
  MediaImageList(
      {this.id = 0,
      this.backdrops = const [],
      this.logos = const [],
      this.posters = const []});

  factory MediaImageList.fromJson(Map<String, dynamic> json) =>
      _$MediaImageListFromJson(json);
  Map<String, dynamic> toJson() => _$MediaImageListToJson(this);
  @override
  String toString() {
    return json.encode(toJson());
  }
}

@JsonSerializable()
class MediaImageItem {
  final double aspectRatio;
  final int height;
  @JsonKey(name: 'iso_639_1')
  final String iso6391;
  final String filePath;
  final double voteAverage;
  final int voteCount;
  final int width;
  MediaImageItem({
    this.aspectRatio = 0.0,
    this.height = 0,
    this.iso6391 = '',
    this.filePath = '',
    this.voteAverage = 0.0,
    this.voteCount = 0,
    this.width = 0,
  });

  factory MediaImageItem.fromJson(Map<String, dynamic> json) =>
      _$MediaImageItemFromJson(json);
  Map<String, dynamic> toJson() => _$MediaImageItemToJson(this);

  @override
  String toString() {
    return json.encode(toJson());
  }
}
