part of 'trending_bloc.dart';

@freezed
class TrendingEvent with _$TrendingEvent {
  const factory TrendingEvent.trending(
      {required MediaType mediaTyp,
      required TimeWindow timeWindow}) = _Trending;
}
