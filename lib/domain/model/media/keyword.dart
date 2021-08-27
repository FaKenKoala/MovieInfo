import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
part 'keyword.g.dart';

@JsonSerializable()
class MediaKeyword {
  final int id;
  final String name;
  MediaKeyword({
    this.id = 0,
    this.name = '',
  });

  factory MediaKeyword.fromJson(Map<String, dynamic> json) =>
      _$MediaKeywordFromJson(json);
  Map<String, dynamic> toJson() => _$MediaKeywordToJson(this);
  @override
  String toString() {
    return json.encode(toJson());
  }
}
