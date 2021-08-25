import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_info/domain/model/generic_converter/generic_converter.dart';
part 'result.g.dart';

@JsonSerializable()
class Result<T> {
  final int page;
  @GenericConverter()
  final List<T> results;
  @JsonKey(name: 'total_pages')
  final int totalPages;
  @JsonKey(name: 'total_results')
  final int totalResults;

  Result(
      {required this.page,
      this.results = const [],
      required this.totalPages,
      required this.totalResults});

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
  Map<String, dynamic> toJson() => _$ResultToJson(this);

  @override
  String toString() {
    return '${toJson()}';
  }
}
