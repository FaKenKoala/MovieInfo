import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_info/domain/model/generic_converter/generic_converter.dart';
part 'api_result.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ApiResult<T> {
  final int page;
  @GenericConverter()
  final List<T> results;
  final int totalPages;
  final int totalResults;

  ApiResult(
      {required this.page,
      this.results = const [],
      required this.totalPages,
      required this.totalResults});

  factory ApiResult.fromJson(Map<String, dynamic> json) => _$ApiResultFromJson(json);
  Map<String, dynamic> toJson() => _$ApiResultToJson(this);

  @override
  String toString() {
    return '${toJson()}';
  }
}
