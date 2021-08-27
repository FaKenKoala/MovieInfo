import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'change.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ChangeList {
  List<Change> changes;

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

@JsonSerializable(genericArgumentFactories: true)
class Change {
  String key;
  List items;

  Change({
    this.key = '',
    this.items = const [],
  });

  factory Change.fromJson(Map<String, dynamic> json) => _$ChangeFromJson(json);
  Map<String, dynamic> toJson() => _$ChangeToJson(this);

  @override
  String toString() {
    return json.encode(toJson());
  }
}

@JsonSerializable()
class ChangeItem {
  final String id;
  final String action;
  final String? time;
  @JsonKey(name: 'iso_639_1')
  final String iso6391;
  @JsonKey(name: 'iso_3166_1')
  final String iso31661;
  final dynamic value;
  final String originalValue;

  ChangeItem({
    this.id = '',
    this.action = '',
    this.time,
    this.iso6391 = '',
    this.iso31661 = '',
    this.value,
    this.originalValue = '',
  });

  factory ChangeItem.fromJson(Map<String, dynamic> json) =>
      _$ChangeItemFromJson(json);
  Map<String, dynamic> toJson() => _$ChangeItemToJson(this);

  @override
  String toString() {
    return json.encode(toJson());
  }
}
