import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'cast.dart';

part 'credit_list.g.dart';

@JsonSerializable()
class CreditList {
  final int id;
  final List<CastCrew> cast;
  final List<CastCrew> crew;
  CreditList({
    this.id = 0,
    this.cast = const [],
    this.crew = const [],
  });

  factory CreditList.fromJson(Map<String, dynamic> json) =>
      _$CreditListFromJson(json);
  Map<String, dynamic> toJson() => _$CreditListToJson(this);

  @override
  String toString() {
    return json.encode(toJson());
  }
}
