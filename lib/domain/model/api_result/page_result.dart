import 'package:json_annotation/json_annotation.dart';
part 'page_result.g.dart';

@JsonSerializable(
     genericArgumentFactories: true)
class PageResult<T> {
  final int page;
  final List<T> results;
  final int totalPages;
  final int totalResults;

  PageResult(
      {required this.page,
      this.results = const [],
      required this.totalPages,
      required this.totalResults});

  factory PageResult.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$PageResultFromJson(json, fromJsonT);
  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$PageResultToJson(this, toJsonT);

}
