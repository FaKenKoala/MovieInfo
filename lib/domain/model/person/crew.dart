import 'package:json_annotation/json_annotation.dart';

part 'crew.g.dart';

@JsonSerializable()
class Crew {
  Crew({
    this.adult = false,
    this.gender = 0,
    this.id = 0,
    this.knownForDepartment = '',
    this.name = '',
    this.originalName = '',
    this.popularity = 0.0,
    this.profilePath = '',
    this.jobs = const [],
    this.department = '',
    this.totalEpisodeCount = 0,
  });

  final bool adult;
  final int gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final dynamic profilePath;
  final List<Job> jobs;
  final String department;
  final int totalEpisodeCount;

  factory Crew.fromJson(Map<String, dynamic> json) => _$CrewFromJson(json);
  Map<String, dynamic> toJson() => _$CrewToJson(this);
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
}
