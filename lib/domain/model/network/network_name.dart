import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'network_name.g.dart';

@JsonSerializable()
class NetworkName {
  final String name;
  final String type;
  NetworkName({
    this.name = '',
    this.type = '',
  });

  factory NetworkName.fromJson(Map<String, dynamic> json) =>
      _$NetworkNameFromJson(json);
  Map<String, dynamic> toJson() => _$NetworkNameToJson(this);
  @override
  String toString() {
    return json.encode(toJson());
  }
}
