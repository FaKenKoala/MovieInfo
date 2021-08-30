part of 'movie_home_bloc.dart';

@freezed
class MovieHomeState with _$MovieHomeState {
  const factory MovieHomeState.initial() = MovieHomeStateInitial;
  const factory MovieHomeState.data(PageResult<Movie> movies) = MovieHomeStateData;
  const factory MovieHomeState.error(AppException e) = MovieHomeStateError;

}
