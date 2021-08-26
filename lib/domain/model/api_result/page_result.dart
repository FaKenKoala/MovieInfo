import 'package:json_annotation/json_annotation.dart';

part 'page_result.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class PageResult<T> {
  final int page;
  final MovieDate? dates;
  final List<T> results;
  final int totalPages;
  final int totalResults;

  PageResult(
      {required this.page,
      this.dates,
      this.results = const [],
      required this.totalPages,
      required this.totalResults});

  factory PageResult.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$PageResultFromJson(json, fromJsonT);
  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$PageResultToJson(this, toJsonT);

  PageResult<T> copyWith({
    int? page,
    MovieDate? dates,
    List<T>? results,
    int? totalPages,
    int? totalResults,
  }) {
    return PageResult(
      page: page ?? this.page,
      dates: dates ?? this.dates,
      results: results ?? this.results,
      totalPages: totalPages ?? this.totalPages,
      totalResults: totalResults ?? this.totalResults,
    );
  }
}

@JsonSerializable()
class MovieDate {
  final DateTime? maximum;
  final DateTime? minimum;
  MovieDate({
    this.maximum,
    this.minimum,
  });

  factory MovieDate.fromJson(Map<String, dynamic> json) =>
      _$MovieDateFromJson(json);
  Map<String, dynamic> toJson() => _$MovieDateToJson(this);
}
