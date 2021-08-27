import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'person.g.dart';

@JsonSerializable()
class Person {
  final int id;
  final bool adult;
  Person({
    this.id = 0,
    this.adult = false,
  });

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
  Map<String, dynamic> toJson() => _$PersonToJson(this);

  @override
  String toString() {
    return json.encode(toJson());
  }
}
