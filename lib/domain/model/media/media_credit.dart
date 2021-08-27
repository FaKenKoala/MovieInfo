import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:movie_info/domain/model/person/cast.dart';
import 'package:movie_info/domain/model/person/crew.dart';

part 'media_credit.g.dart';

@JsonSerializable()
class MediaCredit {
  final int id;
  final List<Cast> cast;
  final List<Crew> crew;
  MediaCredit({
    this.id = 0,
    this.cast = const [],
    this.crew = const [],
  });

  factory MediaCredit.fromJson(Map<String, dynamic> json) =>
      _$MediaCreditFromJson(json);
  Map<String, dynamic> toJson() => _$MediaCreditToJson(this);
  @override
  String toString() {
    return json.encode(toJson());
  }
}
