import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_info/domain/model/enum_values/enum_values.dart';
import 'package:movie_info/infrastructure/app_method/app_method.dart';

part 'trending_method.freezed.dart';

@freezed
class TrendingMethod with _$TrendingMethod  implements AppMethod{
  const factory TrendingMethod.getTrending(
      {required MediaType mediaType,
      required TimeWindow timeWindow}) = GetTrending;
}
