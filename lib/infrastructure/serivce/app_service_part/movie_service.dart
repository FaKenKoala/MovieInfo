part of '../app_service.dart';

mixin MovieService on AppServicePart {
  /// Movie Details
  Future<Movie> getMovieDetail(GetMovieDetail getMovieDetail) async {
    return await remoteRepository.getMovieDetail(
        movieId: getMovieDetail.movieId,
        appendToResponse: getMovieDetail.appendToResponse);
  }

  /// Movie Account State
  Future<AccountState> getMovieAccountState(
      GetMovieAccountState getMovieAccountState) async {
    return await remoteRepository.getMovieAccountState(
      movieId: getMovieAccountState.movieId,
    );
  }

  /// Movie Alternative Titles
  Future<IDResult<Title>> getMovieAlternativeTitles(
      GetMovieAlternativeTitles titles) async {
    return await remoteRepository.getMovieAlternativeTitles(
      movieId: titles.movieId,
      country: titles.country,
    );
  }

  /// Movie Changes
  Future<ChangeList> getMovieChanges(
    GetMovieChanges changes,
  ) async {
    return await remoteRepository.getMovieChanges(
      movieId: changes.movieId,
      startDate: changes.startDate,
      endDate: changes.endDate,
      page: changes.page,
    );
  }

  /// Movie Credits
  Future<MovieCredit> getMovieCredit(GetMovieCredit credit) async {
    return await remoteRepository.getMovieCredit(
      movieId: credit.movieId,
    );
  }

  /// Movie External Ids
  Future<ExternalId> getMovieExternalId(GetMovieExternalId id) async {
    return await remoteRepository.getMovieExternalId(movieId: id.movieId);
  }

  /// Movie Images
  Future<MovieImage> getMovieImage(GetMovieImage image) async {
    return await remoteRepository.getMovieImage(
        movieId: image.movieId, );
  }

  /// Movie Changes
  Future<IDResult<Keyword>> getMovieKeyword(GetMovieKeyword change) async {
    return await remoteRepository.getMovieKeyword(movieId: change.movieId);
  }

  /// Movie Lists belongs to
  Future<PageResult<MovieList>> getMovieBelongList(
      GetMovieBelongList list) async {
    return await remoteRepository.getMovieBelongList(
        movieId: list.movieId, page: list.page);
  }

  /// Movie Lists belongs to
  Future<PageResult<Recommendation>> getMovieRecommendation(
      GetMovieRecommendation list) async {
    return await remoteRepository.getMovieRecommendation(
        movieId: list.movieId, page: list.page);
  }

  /// Movie Release Dates
  Future<IDResult<ReleaseDateWithCountry>> getMovieReleaseDate(
      GetMovieReleaseDate date) async {
    return await remoteRepository.getMovieReleaseDate(
      movieId: date.movieId,
    );
  }

  /// Movie Lists belongs to
  Future<PageResult<Review>> getMovieReview(GetMovieReview review) async {
    return await remoteRepository.getMovieReview(
        movieId: review.movieId, page: review.page);
  }

  /// Movie Lists belongs to
  Future<PageResult<Movie>> getMovieSimilar(GetSimilarMovie similar) async {
    return await remoteRepository.getSimilarMovie(
        movieId: similar.movieId,
        
        page: similar.page);
  }

  /// Movie Translations
  Future<TranslationList> getMovieTranslation(
      GetMovieTranslation translation) async {
    return await remoteRepository.getMovieTranslation(
      movieId: translation.movieId,
    );
  }

  /// Movie Videos
  Future<TranslationList> getMovieVideo(GetMovieVideo video) async {
    return await remoteRepository.movieVideo(
      movieId: video.movieId,
      
    );
  }

  /// Movie Watch Provider
  Future<WatchProviderList> getMovieWatchProvider(
      GetMovieWatchProvider video) async {
    return await remoteRepository.getMovieWatchProvider(
      movieId: video.movieId,
    );
  }

  /// Rate Movie
  Future<CodeResponse> rateMovie(RateMovie rateMovie) async {
    return await remoteRepository.rateMovie(
        movieId: rateMovie.movieId, content: rateMovie.rateContent);
  }

  /// Delete Rate Movie
  Future<CodeResponse> deleteMovieRate(DeleteMovieRate rate) async {
    return await remoteRepository.deleteMovieRate(movieId: rate.movieId);
  }

  /// Get Latest Movie
  Future<Movie> getLatestMovie(GetLatestMovie movie) async {
    return await remoteRepository.getLatestMovie();
  }

  /// Get Now Playing Movie
  Future<PageResult<Movie>> getNowPlayingMovie(GetNowPlayingMovie movie) async {
    return await remoteRepository.getNowPlayingMovie(
         page: movie.page, region: movie.region);
  }

  /// Get Popular Movie
  Future<PageResult<Movie>> getPopularMovie(GetPopularMovie movie) async {
    return await remoteRepository.getPopularMovie(
         page: movie.page, region: movie.region);
  }

  /// Get Top Rated Movie
  Future<PageResult<Movie>> getTopRatedMovie(GetTopRatedMovie movie) async {
    return await remoteRepository.getTopRatedMovie(
         page: movie.page, region: movie.region);
  }

  /// Get Upcoming Movie
  Future<PageResult<Movie>> getUpcomingMovie(GetUpcomingMovie movie) async {
    return await remoteRepository.getUpcomingMovie(
         page: movie.page, region: movie.region);
  }
}
