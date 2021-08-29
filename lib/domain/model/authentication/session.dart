import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'session.g.dart';

@JsonSerializable()
class Session {
  final bool success;
  final String sessionId;
  Session({
    this.success = false,
    this.sessionId = '',
  });

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);
  Map<String, dynamic> toJson() => _$SessionToJson(this);
  @override
  String toString() {
    return json.encode(toJson());
  }
}
