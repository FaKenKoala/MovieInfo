part of 'movie_bloc.dart';

@freezed
class MovieState with _$MovieState {
  const factory MovieState.initial() = MovieStateInitial;
  const factory MovieState.detail(Movie movie) = MovieStateDetail;
  const factory MovieState.accountState(AccountState accountState) =
      MovieStateAccountState;
  const factory MovieState.error(Exception e) = MovieStateError;
  const factory MovieState.image(MovieImage image) = MovieStateImage;
}
