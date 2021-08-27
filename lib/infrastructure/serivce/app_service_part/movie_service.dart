part of '../app_service.dart';

mixin MovieService on AppServicePart {
  /// Movie Details

  get getMovieDetail => remoteRepository.getMovieDetail;

  /// Movie Account State
  get getMovieAccountState => remoteRepository.getMovieAccountState;

  /// Movie Alternative Titles
  get getMovieAlternativeTitles => remoteRepository.getMovieAlternativeTitles;

  /// Movie Changes
  get getMovieChanges => remoteRepository.getMovieChanges;

  /// Movie Credits
  get getMovieCredit => remoteRepository.getMovieCredit;

  /// Movie External Ids
  get getMovieExternalId => remoteRepository.getMovieExternalId;

  /// Movie Images
  get getMovieImage => remoteRepository.getMovieImage;

  /// Movie Changes
  get getMovieKeyword => remoteRepository.getMovieKeyword;

  /// Movie Lists belongs to
  get getMovieBelongList => remoteRepository.getMovieBelongList;

  /// Movie Lists belongs to
  get getMovieRecommendation => remoteRepository.getMovieRecommendation;

  /// Movie Release Dates
  get getMovieReleaseDate => remoteRepository.getMovieReleaseDate;

  /// Movie Lists belongs to
  get getMovieReview => remoteRepository.getMovieReview;

  /// Movie Lists belongs to
  get getSimilarMovie => remoteRepository.getSimilarMovie;

  /// Movie Translations
  get getMovieTranslation => remoteRepository.getMovieTranslation;

  /// Movie Videos
  get getMovieVideo => remoteRepository.getMovieVideo;

  /// Movie Watch Provider
  get getMovieWatchProvider => remoteRepository.getMovieWatchProvider;

  /// Rate Movie
  get rateMovie => remoteRepository.rateMovie;

  /// Delete Rate Movie
  get deleteMovieRate => remoteRepository.deleteMovieRate;

  /// Get Latest Movie
  get getLatestMovie => remoteRepository.getLatestMovie;

  /// Get Now Playing Movie
  get getNowPlayingMovie => remoteRepository.getNowPlayingMovie;

  /// Get Popular Movie
  get getPopularMovie => remoteRepository.getPopularMovie;

  /// Get Top Rated Movie
  get getTopRatedMovie => remoteRepository.getTopRatedMovie;

  /// Get Upcoming Movie
  get getUpcomingMovie => remoteRepository.getUpcomingMovie;
}
