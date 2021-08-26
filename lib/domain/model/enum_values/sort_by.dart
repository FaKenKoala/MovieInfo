import 'package:freezed_annotation/freezed_annotation.dart';

enum SortByKeyword {
  @JsonValue('popularity')
  Popularity,
  @JsonValue('release_date')
  ReleaseDate,
  @JsonValue('revenue')
  Revenue,
  @JsonValue('primary_release_date')
  PrimaryReleaseDate,
  @JsonValue('original_title')
  OriginalTitle,
  @JsonValue('vote_average')
  VoteAverage,
  @JsonValue('vote_count')
  VoteCount,
}

enum SortByDirection {
  @JsonValue('asc')
  ASC,
  @JsonValue('desc')
  DESC
}

const SortByKeywordEnumMap = {
  SortByKeyword.Popularity: 'popularity',
  SortByKeyword.ReleaseDate: 'release_date',
  SortByKeyword.Revenue: 'revenue',
  SortByKeyword.PrimaryReleaseDate: 'primary_release_date',
  SortByKeyword.OriginalTitle: 'original_title',
  SortByKeyword.VoteAverage: 'vote_average',
  SortByKeyword.VoteCount: 'vote_count',
};

const SortByDirectionEnumMap = {
  SortByDirection.ASC: 'asc',
  SortByDirection.DESC: 'desc',
};

extension SortByKeywordX on SortByKeyword {
  String get name => SortByKeywordEnumMap[this]!;
}

extension SortByDirectionX on SortByDirection {
  String get name => SortByDirectionEnumMap[this]!;
}