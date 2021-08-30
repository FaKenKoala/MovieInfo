part of 'movie_home_bloc.dart';

@freezed
class MovieHomeEvent with _$MovieHomeEvent {
  const factory MovieHomeEvent.trending() = _MovieEventTrending;

  const factory MovieHomeEvent.popular({@Default(1) int page}) =
      _MovieEventPopular;
  const factory MovieHomeEvent.nowPlaying({@Default(1) int page}) =
      _MovieEventNowPlaing;
  const factory MovieHomeEvent.upcoming({@Default(1) int page}) =
      _MovieEventUpcoming;
  const factory MovieHomeEvent.topRated({@Default(1) int page}) =
      _MovieEventTopRated;

  const factory MovieHomeEvent.index({required int pos, @Default(1) int page}) =
      _MovieEventIndex;
}
