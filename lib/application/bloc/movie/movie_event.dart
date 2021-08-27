part of 'movie_bloc.dart';

@freezed
class MovieEvent with _$MovieEvent {
  const factory MovieEvent.detail(
      {required int movieId,
     }) = _MovieEventDetail;

  const factory MovieEvent.accountState({
    required int movieId,
  }) = _MovieEventAccountState;

  const factory MovieEvent.image({
    required int movieId,
  }) = _MovieEventImage;
}
