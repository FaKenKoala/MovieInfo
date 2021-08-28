import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:movie_info/domain/model/person/person.dart';

part 'tv_credit_list.g.dart';

@JsonSerializable()
class TVCreditList {
  final int id;
  final List<Person> cast;
  final List<Person> crew;
  TVCreditList({
    this.id = 0,
    this.cast = const [],
    this.crew = const [],
  });

  factory TVCreditList.fromJson(Map<String, dynamic> json) =>
      _$TVCreditListFromJson(json);
  Map<String, dynamic> toJson() => _$TVCreditListToJson(this);

  @override
  String toString() {
    return json.encode(toJson());
  }
}
