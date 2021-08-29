part of '../app_service.dart';

mixin AccountService on AppServicePart {
  Future<Account> getAccountDetail(GetAccountDetail detail) {
    return remoteRepository.getAccountDetail();
  }

  Future getCreatedList(GetCreatedList list) {
    return remoteRepository.getCreatedList(accountId, list.page);
  }

  Future getFavoriteMovies(GetFavoriteMovies movie) {
    return remoteRepository.getFavoriteMovies(
      accountId,
      movie.sortBy,
      movie.page,
    );
  }

  Future getFavoriteTVs(GetFavoriteTVs tv) {
    return remoteRepository.getFavoriteTVs(
      accountId,
      tv.sortBy,
      tv.page,
    );
  }

  Future markAsFavorite(MarkAsFavorite mark) {
    return remoteRepository.markAsFavorite(
      accountId,
      mark.content,
    );
  }

  Future getAccountRatedMovies(GetAccountRatedMovies movie) {
    return remoteRepository.getAccountRatedMovies(
      accountId,
      movie.sortBy,
      movie.page,
    );
  }

  Future getAccountRatedTVs(GetAccountRatedTVs tv) {
    return remoteRepository.getAccountRatedTVs(
      accountId,
      tv.sortBy,
      tv.page,
    );
  }

  Future getAccountRatedTVEpisodes(GetAccountRatedTVEpisodes episode) {
    return remoteRepository.getAccountRatedTVEpisodes(
      accountId,
      episode.sortBy,
      episode.page,
    );
  }

  Future getMovieWatchlist(GetMovieWatchlist watchlist) {
    return remoteRepository.getWatchlistMovies(
      accountId,
      watchlist.sortBy,
      watchlist.page,
    );
  }

  Future getTVWatchlist(GetTVWatchlist watchlist) {
    return remoteRepository.getWatchlistTVs(
      accountId,
      watchlist.sortBy,
      watchlist.page,
    );
  }

  Future<CodeResponse> addToWatchlist(AddToWatchlist watchlist) async {
    return await remoteRepository.addToWatchlist(
      accountId,
      watchlist.content,
    );
  }

  int get accountId => AppConfig.instance.account?.id ?? -1;
}
