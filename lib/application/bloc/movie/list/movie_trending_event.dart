part of 'movie_trending_bloc.dart';

@freezed
class MovieTrendingEvent with _$MovieTrendingEvent {
  const factory MovieTrendingEvent.trending() = _MovieTrendingEventList;
}