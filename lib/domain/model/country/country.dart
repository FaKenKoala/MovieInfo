import 'package:freezed_annotation/freezed_annotation.dart';
part 'country.g.dart';

@JsonSerializable()
class Country {
  @JsonKey(name: 'iso_3166_1')
  final String iso31661;
  final String name;
  Country({
    required this.iso31661,
    required this.name,
  });

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);
  Map<String, dynamic> toJson() => _$CountryToJson(this);
}
