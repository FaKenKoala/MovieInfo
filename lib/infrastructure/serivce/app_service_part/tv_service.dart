part of '../app_service.dart';

mixin TVService on AppServicePart {
  /// TV Details
  get getTVDetail => remoteRepository.getTVDetail;

  /// TV Account State
  get getTVAccountState => remoteRepository.getTVAccountState;

  /// TV Aggregate Cast
  get getTVAggregateCredit => remoteRepository.getTVAggregateCredit;

  /// TV Alternative Titles
  get getTVAlternativeTitles => remoteRepository.getTVAlternativeTitles;

  get getTVChanges => remoteRepository.getTVChanges;

  get getTVContentRating => remoteRepository.getTVContentRating;

  get getTVCredit => remoteRepository.getTVCredit;

  get getTVEpisodeGroups => remoteRepository.getTVEpisodeGroups;

  /// TV External Ids
  get getTVExternalId => remoteRepository.getTVExternalId;

  /// TV Images
  get getTVImage => remoteRepository.getTVImage;

  /// TV Changes
  get getTVKeyword => remoteRepository.getTVKeyword;

  /// TV Lists belongs to
  get getTVRecommendation => remoteRepository.getTVRecommendation;

  /// TV Release Dates
  get getTVReleaseDate => remoteRepository.getTVReleaseDate;

  /// TV Lists belongs to
  get getTVReview => remoteRepository.getTVReview;

  /// TV Lists belongs to
  get getSimilarTV => remoteRepository.getSimilarTV;

  /// TV Translations
  get getTVTranslation => remoteRepository.getTVTranslation;

  /// TV Videos
  get getTVVideo => remoteRepository.getTVVideo;

  /// TV Watch Provider
  get getTVWatchProvider => remoteRepository.getTVWatchProvider;

  /// Rate TV
  get rateTV => remoteRepository.rateTV;

  /// Delete Rate TV
  get deleteTVRate => remoteRepository.deleteTVRate;

  /// Get Latest TV
  get getLatestTV => remoteRepository.getLatestTV;

  /// Get Now Playing TV
  get getNowPlayingTV => remoteRepository.getNowPlayingTV;

  /// Get Popular TV
  get getPopularTV => remoteRepository.getPopularTV;

  /// Get Top Rated TV
  get getTopRatedTV => remoteRepository.getTopRatedTV;

  /// Get Upcoming TV
  get getUpcomingTV => remoteRepository.getUpcomingTV;
}
