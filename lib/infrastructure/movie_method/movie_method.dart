import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_info/domain/model/enum_values/enum_values.dart';
part 'movie_method.freezed.dart';

@freezed
class MovieMethod with _$MovieMethod {
  const factory MovieMethod.trending(
      {required MediaType mediaType,
      required TimeWindow timeWindow}) = GetTrending;

  const factory MovieMethod.configuration() = GetConfiguration;
}
