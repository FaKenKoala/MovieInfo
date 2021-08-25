import 'package:freezed_annotation/freezed_annotation.dart';

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

extension MediaTypeX on MediaType {
  String get name => MediaTypeEnumMap[this]!;
}
