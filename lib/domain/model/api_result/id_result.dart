import 'package:json_annotation/json_annotation.dart';

part 'id_result.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class IDResult<T> {
  final int id;
  final List<T> results;
  IDResult({
    this.id = 0,
    this.results = const [],
  });

  factory IDResult.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$IDResultFromJson(json, fromJsonT);
  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$IDResultToJson(this, toJsonT);
}
