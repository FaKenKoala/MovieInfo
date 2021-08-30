import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_info/domain/model/authentication/add_to_watchlist_content.dart';
import 'package:movie_info/domain/model/authentication/mark_favorite_content.dart';
import 'package:movie_info/infrastructure/app_method/app_method.dart';

part 'account_method.freezed.dart';

@freezed
class AccountMethod with _$AccountMethod implements AppMethod {
  const factory AccountMethod.getAccountDetail() = GetAccountDetail;

  const factory AccountMethod.getCreatedList({
    int? page,
  }) = GetCreatedList;

  const factory AccountMethod.getFavoriteMovies({
    String? sortBy,
    int? page,
  }) = GetFavoriteMovies;

  const factory AccountMethod.getFavoriteTVs({
    String? sortBy,
    int? page,
  }) = GetFavoriteTVs;

  const factory AccountMethod.markAsFavorite({
    required MarkFavoriteContent content,
  }) = MarkAsFavorite;

  const factory AccountMethod.getAccountRatedMovies({
    String? sortBy,
    int? page,
  }) = GetAccountRatedMovies;

  const factory AccountMethod.getAccountRatedTVs({
    String? sortBy,
    int? page,
  }) = GetAccountRatedTVs;

  const factory AccountMethod.getAccountRatedTVEpisodes({
    String? sortBy,
    int? page,
  }) = GetAccountRatedTVEpisodes;

  const factory AccountMethod.getMovieWatchlist({
    String? sortBy,
    int? page,
  }) = GetMovieWatchlist;

  const factory AccountMethod.getTVWatchlist({
    String? sortBy,
    int? page,
  }) = GetTVWatchlist;

  const factory AccountMethod.addToWatchlist(
      {required AddtoWatchlistContent content}) = AddToWatchlist;
}
