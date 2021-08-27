import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'change.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ChangeList {
  List<ChangeItem> changes;

  ChangeList({
    this.changes = const [],
  });

  factory ChangeList.fromJson(Map<String, dynamic> json) =>
      _$ChangeListFromJson(json);
  Map<String, dynamic> toJson() => _$ChangeListToJson(this);

  @override
  String toString() {
    return json.encode(toJson());
  }
}

@JsonSerializable()
class ChangeItem {
  String key;
  List<ChangeContent> items;

  ChangeItem({
    this.key = '',
    this.items = const [],
  });

  factory ChangeItem.fromJson(Map<String, dynamic> json) => _$ChangeItemFromJson(json);
  Map<String, dynamic> toJson() => _$ChangeItemToJson(this);

  @override
  String toString() {
    return json.encode(toJson());
  }
}

@JsonSerializable()
class ChangeContent {
  final String id;
  final bool adult;
  final String action;
  final String? time;
  @JsonKey(name: 'iso_639_1')
  final String iso6391;
  @JsonKey(name: 'iso_3166_1')
  final String iso31661;
  final dynamic value;
  final String originalValue;

  ChangeContent({
    this.id = '',
    this.adult = false,
    this.action = '',
    this.time,
    this.iso6391 = '',
    this.iso31661 = '',
    this.value,
    this.originalValue = '',
  });

  factory ChangeContent.fromJson(Map<String, dynamic> json) =>
      _$ChangeContentFromJson(json);
  Map<String, dynamic> toJson() => _$ChangeContentToJson(this);

  @override
  String toString() {
    return json.encode(toJson());
  }
}
