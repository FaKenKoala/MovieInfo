import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'cast.dart';
import 'crew.dart';

part 'credit_list.g.dart';

@JsonSerializable()
class CreditList {
  final int id;
  final List<Cast> cast;
  final List<Crew> crew;
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
