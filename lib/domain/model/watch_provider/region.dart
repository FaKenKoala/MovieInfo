import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'region.g.dart';

@JsonSerializable()
class Region {
  @JsonKey(name: 'iso_3166_1')
  final String iso31661;
  final String englishName;
  final String nativeName;
  Region({this.iso31661 = '', this.englishName = '', this.nativeName = ''});

  factory Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);
  Map<String, dynamic> toJson() => _$RegionToJson(this);

  @override
  String toString() {
    return json.encode(toJson());
  }
}
