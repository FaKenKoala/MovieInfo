import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'new_list_content.g.dart';

@JsonSerializable()
class NewListContent {
  final String name;
  final String description;
  final String language;

  NewListContent({
    this.name = '',
    this.description = '',
    this.language = '',
  });

  factory NewListContent.fromJson(Map<String, dynamic> json) =>
      _$NewListContentFromJson(json);
  Map<String, dynamic> toJson() => _$NewListContentToJson(this);

  @override
  String toString() {
    return json.encode(toJson());
  }
}
