import 'package:freezed_annotation/freezed_annotation.dart';

enum ExternalSource {
  @JsonValue('imdb_id')
  IMDB_ID,
  @JsonValue('freebase_mid')
  Freebase_MID,
  @JsonValue('tvdb_id')
  TVDB_ID,
  @JsonValue('tvrage_id')
  TVRAGE_ID,
  @JsonValue('facebook_id')
  FaceBook_ID,
  @JsonValue('twitter_id')
  Twitter_ID,
  @JsonValue('instagram_id')
  Instagram_ID,
}

const ExternalSourceEnumMap = {
  ExternalSource.IMDB_ID: 'imdb_id',
  ExternalSource.Freebase_MID: 'freebase_mid',
  ExternalSource.TVDB_ID: 'tvdb_id',
  ExternalSource.TVRAGE_ID: 'tvrage_id',
  ExternalSource.FaceBook_ID: 'facebook_id',
  ExternalSource.Twitter_ID: 'twitter_id',
  ExternalSource.Instagram_ID: 'instagram_id',
};

extension ExternalSourceX on ExternalSource {
  String get name => ExternalSourceEnumMap[this]!;
}
