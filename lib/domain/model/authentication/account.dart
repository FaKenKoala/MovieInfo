import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'account.g.dart';

@JsonSerializable()
class Account {
  final int id;
  @JsonKey(name: 'iso_639_1')
  final String iso6391;
  @JsonKey(name: 'iso_3166_1')
  final String iso31661;
  final String name;
  final bool includeAdult;
  final String username;
  Account({
    this.id = 0,
    this.iso6391 = '',
    this.iso31661 = '',
    this.name = '',
    this.includeAdult = false,
    this.username = '',
  });

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
  Map<String, dynamic> toJson() => _$AccountToJson(this);

  @override
  String toString() {
    return json.encode(toJson());
  }
}
