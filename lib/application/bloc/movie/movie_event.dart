part of 'movie_bloc.dart';

@freezed
class MovieEvent with _$MovieEvent {
  const factory MovieEvent.detail(
      {required int movieId,
      String? language,
      String? appendToResponse}) = _MovieEventDetail;

  const factory MovieEvent.accountState({
    required int movieId,
  }) = _MovieEventAccountState;
}
