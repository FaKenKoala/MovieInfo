import 'package:json_annotation/json_annotation.dart';

part 'keywords.g.dart';

@JsonSerializable(explicitToJson: true)
class KeywordList {
  final int id;
  final List<Keyword> keywords;
  KeywordList({
    this.id = 0,
    this.keywords = const [],
  });

  factory KeywordList.fromJson(Map<String, dynamic> json) =>
      _$KeywordListFromJson(json);
  Map<String, dynamic> toJson() => _$KeywordListToJson(this);
}

@JsonSerializable()
class Keyword {
  final int id;
  final String name;
  Keyword({
    this.id = 0,
    this.name = '',
  });

  factory Keyword.fromJson(Map<String, dynamic> json) =>
      _$KeywordFromJson(json);
  Map<String, dynamic> toJson() => _$KeywordToJson(this);
}
