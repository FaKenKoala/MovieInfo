import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'timezone.g.dart';

@JsonSerializable()
class TimeZone {
  @JsonKey(name: 'iso_3166_1')
  final String iso31661;
  final List<String> zones;
  TimeZone({
    this.iso31661 = '',
    this.zones = const [],
  });

  factory TimeZone.fromJson(Map<String, dynamic> json) => _$TimeZoneFromJson(json);
  Map<String, dynamic> toJson() => _$TimeZoneToJson(this);  

  @override
  String toString() {
    return json.encode(toJson());
  }
} 