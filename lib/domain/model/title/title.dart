import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'title.g.dart';

@JsonSerializable()
class Title {
  @JsonKey(name: 'iso_3166_1')
  final String iso31661;
  final String title;
  final String type;
  Title({
    this.iso31661 = '',
    this.title = '',
    this.type = '',
  });

  factory Title.fromJson(Map<String, dynamic> json) => _$TitleFromJson(json);

  Map<String, dynamic> toJson() => _$TitleToJson(this);
  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
