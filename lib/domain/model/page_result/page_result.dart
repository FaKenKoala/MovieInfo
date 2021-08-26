import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_info/domain/model/generic_converter/generic_converter.dart';
part 'page_result.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PageResult<T> {
  final int page;
  @GenericConverter()
  final List<T> results;
  final int totalPages;
  final int totalResults;

  PageResult(
      {required this.page,
      this.results = const [],
      required this.totalPages,
      required this.totalResults});

  factory PageResult.fromJson(Map<String, dynamic> json) => _$PageResultFromJson(json);
  Map<String, dynamic> toJson() => _$PageResultToJson(this);

  @override
  String toString() {
    return '${toJson()}';
  }
}
