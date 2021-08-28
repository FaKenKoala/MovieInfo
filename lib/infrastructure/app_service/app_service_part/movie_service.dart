part of '../app_service.dart';

mixin MovieService on AppServicePart {
  get getMovieDetail => remoteRepository.getMovieDetail;

  get getMovieAccountState => remoteRepository.getMovieAccountState;

  get getMovieAlternativeTitles => remoteRepository.getMovieAlternativeTitles;

  get getMovieChanges => remoteRepository.getMovieChanges;

  get getMovieCredit => remoteRepository.getMovieCredit;

  get getMovieExternalId => remoteRepository.getMovieExternalId;

  get getMovieImage => remoteRepository.getMovieImage;

  get getMovieKeyword => remoteRepository.getMovieKeyword;

  get getMovieBelongList => remoteRepository.getMovieBelongList;

  get getMovieRecommendation => remoteRepository.getMovieRecommendation;

  get getMovieReleaseDate => remoteRepository.getMovieReleaseDate;

  get getMovieReview => remoteRepository.getMovieReview;

  get getSimilarMovie => remoteRepository.getSimilarMovie;

  get getMovieTranslation => remoteRepository.getMovieTranslation;

  get getMovieVideo => remoteRepository.getMovieVideo;

  get getMovieWatchProvider => remoteRepository.getMovieWatchProvider;

  get rateMovie => remoteRepository.rateMovie;

  get deleteMovieRate => remoteRepository.deleteMovieRate;

  get getLatestMovie => remoteRepository.getLatestMovie;

  get getNowPlayingMovie => remoteRepository.getNowPlayingMovie;

  get getPopularMovie => remoteRepository.getPopularMovie;

  get getTopRatedMovie => remoteRepository.getTopRatedMovie;

  get getUpcomingMovie => remoteRepository.getUpcomingMovie;
}
