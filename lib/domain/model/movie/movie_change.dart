import 'package:json_annotation/json_annotation.dart';

part 'movie_change.g.dart';

@JsonSerializable()
class Changes {
  List<Change> changes;

  Changes({
    this.changes = const [],
  });

  Map<String, dynamic> toJson() => _$ChangesToJson(this);
  factory Changes.fromJson(Map<String, dynamic> json) =>
      _$ChangesFromJson(json);
}

@JsonSerializable()
class Change {
  String key;
  List<ChangeItem> items;

  Change({
    this.key = '',
    this.items = const [],
  });

  factory Change.fromJson(Map<String, dynamic> json) => _$ChangeFromJson(json);
  Map<String, dynamic> toJson() => _$ChangeToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ChangeItem {
  String id;
  String action;
  String time;
  @JsonKey(name: 'iso_639_1')
  String iso6391;
  String value;
  String originalValue;

  ChangeItem({
    this.id = '',
    this.action = '',
    this.time = '',
    this.iso6391 = '',
    this.value = '',
    this.originalValue = '',
  });

  factory ChangeItem.fromJson(Map<String, dynamic> json) =>
      _$ChangeItemFromJson(json);
  Map<String, dynamic> toJson() => _$ChangeItemToJson(this);
}
