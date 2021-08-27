import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'list_result.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ListResult<T> {
  final List<T> results;
  ListResult({
    this.results = const [],
  });

  factory ListResult.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$ListResultFromJson(json, fromJsonT);
  Map<String, dynamic> toJson(
    Object? Function(T value) toJsonT,
  ) =>
      _$ListResultToJson(this, toJsonT);

  @override
  String toString() {
    return json.encode(toJson((T t) => json.decode(t.toString())));
  }
}
