import 'package:json_annotation/json_annotation.dart';
part 'cast.g.dart';

@JsonSerializable(explicitToJson: true)
class Cast {
  Cast({
    this.adult = false,
    this.gender = 0,
    this.id = 0,
    this.knownForDepartment = '',
    this.name = '',
    this.originalName = '',
    this.popularity = 0.0,
    this.profilePath = '',
    this.order = 0,
    this.roles = const [],
    this.totalEpisodeCount = 0,
  });

  final bool adult;
    final int gender;
    final int id;
    final String knownForDepartment;
    final String name;
    final String originalName;
    final double popularity;
    final String profilePath;
    final List<Role> roles;
    final int totalEpisodeCount;
    final int order;


  factory Cast.fromJson(Map<String, dynamic> json) => _$CastFromJson(json);
  Map<String, dynamic> toJson() => _$CastToJson(this);
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
}


