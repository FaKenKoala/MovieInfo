import 'dart:core';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_info/domain/model/movie/movie.dart';
import 'package:movie_info/domain/model/person/person.dart';
import 'package:movie_info/domain/model/tv/tv.dart';

import 'enum_values.dart';

enum MediaType {
  @JsonValue('all')
  ALL,
  @JsonValue('movie')
  MOVIE,
  @JsonValue('tv')
  TV,
  @JsonValue('person')
  PERSON
}

const MediaTypeEnumMap = {
  MediaType.ALL: 'all',
  MediaType.MOVIE: 'movie',
  MediaType.TV: 'tv',
  MediaType.PERSON: 'person',
};

@sealed
abstract class MediaTypeInDynaimc {
  static mediaTypeInDynamic(dynamic e, [MediaType? mediaType]) {
    switch (enumDecodeNullable(MediaTypeEnumMap, mediaType ?? e['media_type'],
        unknownValue: MediaType.ALL)) {
      case MediaType.MOVIE:
        return Movie.fromJson(e);
      case MediaType.TV:
        return TV.fromJson(e);
      case MediaType.PERSON:
        return Person.fromJson(e);
      default:
        return e;
    }
  }

  static fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      return mediaTypeInDynamic(json);
    }
    return json;
  }

  static fromList(List<dynamic>? list) {
    return list?.map(fromJson).toList() ?? [];
  }
}

extension MediaTypeX on MediaType {
  String get name => MediaTypeEnumMap[this]!;
}

class MediaTypeBase {
  final MediaType mediaType;
  final Map<String, dynamic>? data;
  MediaTypeBase(this.mediaType, [this.data]);

  factory MediaTypeBase.fromJson(Map<String, dynamic> json) {
    switch (enumDecodeNullable(MediaTypeEnumMap, json['media_type'],
        unknownValue: MediaType.ALL)) {
      case MediaType.MOVIE:
        return Movie.fromJson(json);
      case MediaType.TV:
        return TV.fromJson(json);
      case MediaType.PERSON:
        return Person.fromJson(json);
      default:
        return MediaTypeBase(MediaType.ALL, json);
    }
  }

  Map<String, dynamic> toJson() {
    switch (mediaType) {
      case MediaType.MOVIE:
        return (this as Movie).toJson();
      case MediaType.TV:
        return (this as TV).toJson();
      case MediaType.PERSON:
        return (this as Person).toJson();
      default:
    }
    return data ?? {};
  }
}
