part of 'movie_detail_bloc.dart';

@freezed
class MovieDetailState with _$MovieDetailState {
  const factory MovieDetailState.initial() = MovieStateInitial;
  const factory MovieDetailState.detail(Movie movie) = MovieStateDetail;
  const factory MovieDetailState.accountState(AccountState accountState) =
      MovieStateAccountState;
  const factory MovieDetailState.error(Exception e) = MovieStateError;
  const factory MovieDetailState.image(MediaImageList image) = MovieStateImage;
}
