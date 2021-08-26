import 'package:json_annotation/json_annotation.dart';
part 'cast.g.dart';

@JsonSerializable()
class Cast {
  Cast(
      {this.adult = false,
      this.gender = 0,
      this.id = 0,
      this.knownForDepartment = '',
      this.name = '',
      this.originalName = '',
      this.popularity = 0.0,
      this.profilePath = '',
      this.castId = 0,
      this.character = '',
      this.creditId = '',
      this.order = 0,
      this.department = '',
      this.job = ''});

  final bool adult;
  final int gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String profilePath;
  final int castId;
  final String character;
  final String creditId;
  final int order;

  final String department;
  final String job;

  factory Cast.fromJson(Map<String, dynamic> json) => _$CastFromJson(json);
  Map<String, dynamic> toJson() => _$CastToJson(this);
}
