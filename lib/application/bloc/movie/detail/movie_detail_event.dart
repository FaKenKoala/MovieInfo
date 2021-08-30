part of 'movie_detail_bloc.dart';

@freezed
class MovieDetailEvent with _$MovieDetailEvent {
  
  const factory MovieDetailEvent.detail({
    required int movieId,
  }) = _MovieEventDetail;

  const factory MovieDetailEvent.accountState({
    required int movieId,
  }) = _MovieEventAccountState;

  const factory MovieDetailEvent.image({
    required int movieId,
  }) = _MovieEventImage;
}
