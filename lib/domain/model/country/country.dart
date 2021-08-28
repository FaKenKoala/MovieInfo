import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'country.g.dart';

@JsonSerializable()
class Country {
  @JsonKey(name: 'iso_3166_1')
  final String iso31661;
  final String name;
  final String nativeName;
  Country({
    this.iso31661 = '',
    this.name = '',
    this.nativeName = '',
  });

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);
  Map<String, dynamic> toJson() => _$CountryToJson(this);

  @override
  String toString() {
    return json.encode(toJson());
  }
}
