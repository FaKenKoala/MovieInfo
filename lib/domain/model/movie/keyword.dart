import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'keywords.g.dart';

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
  @override
  String toString() {
    return json.encode(toJson());
  }
}
