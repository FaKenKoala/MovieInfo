import 'package:json_annotation/json_annotation.dart';

part 'movie_credit.g.dart';

@JsonSerializable()
class MovieCredit {
  final int id;
  final List<MovieCast> cast;
  final List<MovieCrew> crew;
  MovieCredit({
    this.id = 0,
    this.cast = const [],
    this.crew = const [],
  });

  factory MovieCredit.fromJson(Map<String, dynamic> json) =>
      _$MovieCreditFromJson(json);
  Map<String, dynamic> toJson() => _$MovieCreditToJson(this);
}

@JsonSerializable()
class MovieCast {
  MovieCast({
    this.adult = false,
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
  });

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

  factory MovieCast.fromJson(Map<String, dynamic> json) =>
      _$MovieCastFromJson(json);
  Map<String, dynamic> toJson() => _$MovieCastToJson(this);
}

@JsonSerializable()
class MovieCrew {
  final bool adult;
  final int gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String profilePath;
  final String creditId;
  final String department;
  final String job;

  MovieCrew({
    this.adult = false,
    this.gender = 0,
    this.id = 0,
    this.knownForDepartment = '',
    this.name = '',
    this.originalName = '',
    this.popularity = 0.0,
    this.profilePath = '',
    this.creditId = '',
    this.department = '',
    this.job = '',
  });

  factory MovieCrew.fromJson(Map<String, dynamic> json) =>
      _$MovieCrewFromJson(json);
  Map<String, dynamic> toJson() => _$MovieCrewToJson(this);
}
