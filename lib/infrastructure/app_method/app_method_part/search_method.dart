import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_info/infrastructure/app_method/app_method.dart';

part 'search_method.freezed.dart';

@freezed
abstract class SearchMethod with _$SearchMethod implements AppMethod {
  factory SearchMethod.searchCompany({
    required String query,
    int? page,
  }) = SearchCompany;

  const factory SearchMethod.searchCollection({
    required String query,
    int? page,
  }) = SearchCollection;

  const factory SearchMethod.searchKeyword({
    required String query,
    int? page,
  }) = SearchKeyword;

  const factory SearchMethod.searchMovie({
    required String query,
    int? page,
    bool? includeAdult,
    String? region,
    int? year,
    int? primaryReleaseYear,
  }) = SearchMovie;

  const factory SearchMethod.multiSearch({
    required String query,
    int? page,
    bool? includeAdult,
    String? region,
  }) = MultiSearch;

  const factory SearchMethod.searchPerson({
    required String query,
    int? page,
    bool? includeAdult,
    String? region,
  }) = SearchPerson;

  const factory SearchMethod.searchTV({
    required String query,
    int? page,
    bool? includeAdult,
    int? firstAirDateYear,
  }) = SearchTV;
}
