import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'person.g.dart';

@JsonSerializable()
class Person {
  Person({
    this.adult = false,
    this.alsoKnownAs = const [],
    this.biography = '',
    this.birthday,
    this.character = '',
    this.creditId = '',
    this.deathday,
    this.department = '',
    this.gender = 0,
    this.genreIds = const [],
    this.homepage = '',
    this.id = 0,
    this.imdbId,
    this.job = '',
    this.jobs = const [],
    this.knownFor = const [],
    this.knownForDepartment = '',
    this.name = '',
    this.order = 0,
    this.originalName = '',
    this.placeOfBirth = '',
    this.popularity = 0.0,
    this.profilePath = '',
    this.roles = const [],
    this.totalEpisodeCount = 0,
  });

  final bool adult;
  final List<String> alsoKnownAs;
  final String biography;
  final DateTime? birthday;
  final DateTime? deathday;
  final int gender;
  final List<int> genreIds;
  final String homepage;
  final int id;
  final String? imdbId;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final String placeOfBirth;
  final num popularity;
  final String? profilePath;
  final String character;
  final String creditId;
  final List<Role> roles;
  final int totalEpisodeCount;
  final int order;

  final String job;
  final List<Job> jobs;
  final String department;

  /// media_type: movie/tv/person
  // @JsonKey(fromJson: knownForFromJson, toJson: knownForToJson)
  final List<dynamic> knownFor;

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
  Map<String, dynamic> toJson() => _$PersonToJson(this);

  @override
  String toString() {
    return json.encode(toJson());
  }

  Person copyWith({
    bool? adult,
    int? gender,
    int? id,
    String? knownForDepartment,
    String? name,
    String? originalName,
    double? popularity,
    String? profilePath,
    String? character,
    String? creditId,
    List<Role>? roles,
    int? totalEpisodeCount,
    int? order,
    String? job,
    List<Job>? jobs,
    String? department,
    List<dynamic>? knownFor,
  }) {
    return Person(
      adult: adult ?? this.adult,
      gender: gender ?? this.gender,
      id: id ?? this.id,
      knownForDepartment: knownForDepartment ?? this.knownForDepartment,
      name: name ?? this.name,
      originalName: originalName ?? this.originalName,
      popularity: popularity ?? this.popularity,
      profilePath: profilePath ?? this.profilePath,
      character: character ?? this.character,
      creditId: creditId ?? this.creditId,
      roles: roles ?? this.roles,
      totalEpisodeCount: totalEpisodeCount ?? this.totalEpisodeCount,
      order: order ?? this.order,
      job: job ?? this.job,
      jobs: jobs ?? this.jobs,
      department: department ?? this.department,
      knownFor: knownFor ?? this.knownFor,
    );
  }
}

@JsonSerializable()
class Role {
  final String character;
  final String creditId;
  final int episodeCount;
  Role({
    this.character = '',
    this.creditId = '',
    this.episodeCount = 0,
  });

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);
  Map<String, dynamic> toJson() => _$RoleToJson(this);

  @override
  String toString() {
    return json.encode(toJson());
  }
}

@JsonSerializable()
class Job {
  final String job;
  final String creditId;
  final int episodeCount;
  Job({
    this.job = '',
    this.creditId = '',
    this.episodeCount = 0,
  });

  factory Job.fromJson(Map<String, dynamic> json) => _$JobFromJson(json);
  Map<String, dynamic> toJson() => _$JobToJson(this);

  @override
  String toString() {
    return json.encode(toJson());
  }
}
