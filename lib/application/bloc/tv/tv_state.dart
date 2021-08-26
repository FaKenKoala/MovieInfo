part of 'tv_bloc.dart';

@freezed
class TVState with _$TVState {
  const factory TVState.initial() = TVStateInitial;
  const factory TVState.detail(TV tv) = TVStateDetail;
  const factory TVState.accountState(AccountState accountState) =
      TVStateAccountState;
  const factory TVState.error(Exception e) = TVStateError;
  const factory TVState.image(MovieImage image) = TVStateImage;
}
