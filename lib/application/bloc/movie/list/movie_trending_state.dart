part of 'movie_trending_bloc.dart';

@freezed
class MovieTrendingState with _$MovieTrendingState {
  const factory MovieTrendingState.initial() = MovieTrendingStateInitial;
  const factory MovieTrendingState.trending(PageResult<Movie> movies) = MovieTrendingStateList;
  const factory MovieTrendingState.error(AppException e) = MovieTrendingStateError;

}
