part of 'tv_bloc.dart';

@freezed
class TVEvent with _$TVEvent {
  const factory TVEvent.detail(
      {required int movieId,
      String? language,
      String? appendToResponse}) = _TVEventDetail;

  const factory TVEvent.accountState({
    required int movieId,
  }) = _TVEventAccountState;

  const factory TVEvent.image({
    required int movieId,
    String? language,
  }) = _TVEventImage;
}
