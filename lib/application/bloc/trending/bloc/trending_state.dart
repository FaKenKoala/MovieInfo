part of 'trending_bloc.dart';

@freezed
class TrendingState with _$TrendingState {
  const factory TrendingState.initial() = _Initial;
  const factory TrendingState.data(ApiResult<Movie> data) = _Data;
  const factory TrendingState.error() = _Error;
}
