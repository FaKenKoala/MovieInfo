import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_info/infrastructure/app_method/app_method.dart';
part 'keyword_method.freezed.dart';

@freezed
class KeywordMethod with _$KeywordMethod implements AppMethod {
  const factory KeywordMethod.getKeywordDetail({
    required int keywordId,
  }) = GetKeywordDetail;
  
  const factory KeywordMethod.getKeywordMovies({
    required int keywordId,
    @Default(true) bool includeAdult,
  }) = GetKeywordMovies;
}
