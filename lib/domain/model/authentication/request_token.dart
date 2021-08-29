import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'request_token.g.dart';

@JsonSerializable()
class RequestToken {
  final bool success;
  final String expiresAt;
  final String requestToken;
  RequestToken({
    this.success = false,
    this.expiresAt = '',
    this.requestToken = '',
  });

  factory RequestToken.fromJson(Map<String, dynamic> json) =>
      _$RequestTokenFromJson(json);
  Map<String, dynamic> toJson() => _$RequestTokenToJson(this);

  @override
  String toString() {
    return json.encode(toJson());
  }
}
