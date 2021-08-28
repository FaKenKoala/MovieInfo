import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'media_item_status.g.dart';

@JsonSerializable()
class MediaItemStatus {
  final String id;
  final bool itemPresent;
  MediaItemStatus({
    this.id = '',
    this.itemPresent = false,
  });

  factory MediaItemStatus.fromJson(Map<String, dynamic> json) =>
      _$MediaItemStatusFromJson(json);
  Map<String, dynamic> toJson() => _$MediaItemStatusToJson(this);

  @override
  String toString() {
    return json.encode(toJson());
  }
}
