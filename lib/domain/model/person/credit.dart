import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'person.dart';

part 'credit.g.dart';

@JsonSerializable()
class Credit {
  final String creditType;
  final String department;
  final String job;
  final Media? media;
  final String mediaType;
  final String id;
  final Person? person;
  Credit({
    this.creditType = '',
    this.department = '',
    this.job = '',
    this.media,
    this.mediaType = '',
    this.id = '',
    this.person,
  });

  factory Credit.fromJson(Map<String, dynamic> json) => _$CreditFromJson(json);
  Map<String, dynamic> toJson() => _$CreditToJson(this);

  @override
  String toString() {
    return json.encode(toJson());
  }

  Credit copyWith({
    String? creditType,
    String? department,
    String? job,
    Media? media,
    String? mediaType,
    String? id,
    Person? person,
  }) {
    return Credit(
      creditType: creditType ?? this.creditType,
      department: department ?? this.department,
      job: job ?? this.job,
      media: media ?? this.media,
      mediaType: mediaType ?? this.mediaType,
      id: id ?? this.id,
      person: person ?? this.person,
    );
  }
}

@JsonSerializable()
class Media {
  Media({
    this.adult = false,
    this.backdropPath = '',
    this.id = 0,
    this.originalLanguage = '',
    this.originalTitle = '',
    this.posterPath = '',
    this.voteCount = 0,
    this.video = false,
    this.voteAverage = 0.0,
    this.title = '',
    this.overview = '',
    this.releaseDate,
    this.genreIds = const [],
    this.popularity = 0.0,
    this.character = '',
  });

  final bool adult;
  final String backdropPath;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String posterPath;
  final int voteCount;
  final bool video;
  final double voteAverage;
  final String title;
  final String overview;
  final DateTime? releaseDate;
  final List<int> genreIds;
  final double popularity;
  final String character;

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);
  Map<String, dynamic> toJson() => _$MediaToJson(this);

  @override
  String toString() {
    return json.encode(toJson());
  }
}
