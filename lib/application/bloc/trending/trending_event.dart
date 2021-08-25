part of 'trending_bloc.dart';

@freezed
class TrendingEvent with _$TrendingEvent {
  const factory TrendingEvent.trending(
      {MediaType? mediaType, TimeWindow? timeWindow}) = _Trending;
}
