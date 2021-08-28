import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'add_list_item.g.dart';

@JsonSerializable()
class AddListItem {
  final int id;
  AddListItem({
    required this.id,
  });

  factory AddListItem.fromJson(Map<String, dynamic> json) =>
      _$AddListItemFromJson(json);
  Map<String, dynamic> toJson() => _$AddListItemToJson(this);
  @override
  String toString() {
    return json.encode(toJson());
  }
}
