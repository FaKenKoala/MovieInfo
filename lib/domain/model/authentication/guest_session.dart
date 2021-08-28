import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'guest_session.g.dart';

@JsonSerializable()
class GuestSession {
  final bool succes;
  final String guestSessionId;
  final String expiresAt;
  GuestSession({
    this.succes = false,
    this.guestSessionId = '',
    this.expiresAt = '',
  });

  factory GuestSession.fromJson(Map<String, dynamic> json) =>
      _$GuestSessionFromJson(json);
  Map<String, dynamic> toJson() => _$GuestSessionToJson(this);

  @override
  String toString() {
    return json.encode(toJson());
  }
}
