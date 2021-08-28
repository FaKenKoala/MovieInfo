import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'package:movie_info/domain/model/enum_values/enum_values.dart';

part 'image.g.dart';

@JsonSerializable()
class MediaImageList {
  final int id;
  final List<MediaImageItem> backdrops;
  final List<MediaImageItem> logos;
  final List<MediaImageItem> posters;
  final List<MediaImageItem> stills;
  MediaImageList({
    this.id = 0,
    this.backdrops = const [],
    this.logos = const [],
    this.posters = const [],
    this.stills = const [],
  });

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
  final num voteAverage;
  final int voteCount;
  final int width;
  final String imageType;
  final MediaType mediaType;
  final dynamic media;
  MediaImageItem({
    this.aspectRatio = 0.0,
    this.height = 0,
    this.iso6391 = '',
    this.filePath = '',
    this.voteAverage = 0.0,
    this.voteCount = 0,
    this.width = 0,
    this.imageType = '',
    this.mediaType = MediaType.ALL,
    this.media,
  });

  factory MediaImageItem.fromJson(Map<String, dynamic> json) =>
      _$MediaImageItemFromJson(json);
  Map<String, dynamic> toJson() => _$MediaImageItemToJson(this);

  @override
  String toString() {
    return json.encode(toJson());
  }

  MediaImageItem copyWith({
    double? aspectRatio,
    int? height,
    String? iso6391,
    String? filePath,
    num? voteAverage,
    int? voteCount,
    int? width,
    String? imageType,
    MediaType? mediaType,
    dynamic media,
  }) {
    return MediaImageItem(
      aspectRatio: aspectRatio ?? this.aspectRatio,
      height: height ?? this.height,
      iso6391: iso6391 ?? this.iso6391,
      filePath: filePath ?? this.filePath,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
      width: width ?? this.width,
      imageType: imageType ?? this.imageType,
      mediaType: mediaType ?? this.mediaType,
      media: media ?? this.media,
    );
  }
}
