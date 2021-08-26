import 'package:freezed_annotation/freezed_annotation.dart';

part 'release_date.g.dart';

@JsonSerializable()
class ReleaseDateWithCountry {
  @JsonKey(name: 'iso_3166_1')
  final String iso31661;
  List<ReleaseDate> releaseDates;
  ReleaseDateWithCountry({
    this.iso31661 = '',
    this.releaseDates = const [],
  });

  factory ReleaseDateWithCountry.fromJson(Map<String, dynamic> json) =>
      _$ReleaseDateWithCountryFromJson(json);
  Map<String, dynamic> toJson() => _$ReleaseDateWithCountryToJson(this);
}

@JsonSerializable()
class ReleaseDate {
  ReleaseDate({
    this.certification = '',
    this.iso6391 = '',
    this.releaseDate,
    this.type = 0,
  });

  final String certification;
  @JsonKey(name: 'iso_639_1')
  final String iso6391;
  final DateTime? releaseDate;
  final int type;

  factory ReleaseDate.fromJson(Map<String, dynamic> json) =>
      _$ReleaseDateFromJson(json);
  Map<String, dynamic> toJson() => _$ReleaseDateToJson(this);
}
