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

extension ListX on List {
  get toMediaTypeList => MediaTypeInDynaimc.fromList(this);
}
