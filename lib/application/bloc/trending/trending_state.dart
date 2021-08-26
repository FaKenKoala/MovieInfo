part of 'trending_bloc.dart';

@freezed
class TrendingState with _$TrendingState {
  const factory TrendingState.initial() = _Initial;
  const factory TrendingState.all(PageResult data) = _TrendingAll;
  const factory TrendingState.movie(PageResult<Movie> data) = _TrendingMovie;
  const factory TrendingState.tv(PageResult<TV> data) = _TrendingTV;
  const factory TrendingState.error(Exception exception) = _Error;
}
