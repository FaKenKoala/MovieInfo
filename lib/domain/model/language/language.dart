// Generated by https://quicktype.io

import 'package:freezed_annotation/freezed_annotation.dart';
part 'language.g.dart';

@JsonSerializable()
class Language {
  final String englishName;
  @JsonKey(name: 'iso_639_1')
  final String iso6391;
  @JsonKey(name: 'iso_3166_1')
  final String iso31661;
  final String name;
  final ContentData? data;

  Language({
    this.englishName = '',
    this.iso6391 = '',
    this.name = '',
    this.iso31661 = '',
    this.data,
  });

  factory Language.fromJson(Map<String, dynamic> json) =>
      _$LanguageFromJson(json);
  Map<String, dynamic> toJson() => _$LanguageToJson(this);
}

@JsonSerializable()
class ContentData {
  final String homepage;
  final String overview;
  final int runtime;
  final String tagline;

  final String title;
  ContentData(
      {this.homepage = '',
      this.overview = '',
      this.runtime = 0,
      this.tagline = '',
      this.title = ''});

  factory ContentData.fromJson(Map<String, dynamic> json) =>
      _$ContentDataFromJson(json);
  Map<String, dynamic> toJson() => _$ContentDataToJson(this);
}
