import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:movie_info/domain/model/person/person.dart';

part 'tv_season_credit_list.g.dart';

@JsonSerializable()
class TVSeasonCreditList {
  final int id;
  final List<Person> cast;
  final List<Person> crew;
  TVSeasonCreditList({
    this.id = 0,
    this.cast = const [],
    this.crew = const [],
  });

  factory TVSeasonCreditList.fromJson(Map<String, dynamic> json) =>
      _$TVSeasonCreditListFromJson(json);
  Map<String, dynamic> toJson() => _$TVSeasonCreditListToJson(this);

  @override
  String toString() {
    return json.encode(toJson());
  }
}
