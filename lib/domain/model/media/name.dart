import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'name.g.dart';

@JsonSerializable()
class MediaName {
  final String name;
  final String type;
  MediaName({
    this.name = '',
    this.type = '',
  });

  factory MediaName.fromJson(Map<String, dynamic> json) =>
      _$MediaNameFromJson(json);
  Map<String, dynamic> toJson() => _$MediaNameToJson(this);
  @override
  String toString() {
    return json.encode(toJson());
  }
}
