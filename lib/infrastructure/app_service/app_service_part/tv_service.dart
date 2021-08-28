

part of '../app_service.dart';
mixin TVService on AppServicePart {get getTVDetail => remoteRepository.getTVDetail;

get getTVAccountState => remoteRepository.getTVAccountState;

get getTVAggregateCredit => remoteRepository.getTVAggregateCredit;

get getTVAlternativeTitles => remoteRepository.getTVAlternativeTitles;

get getTVChanges => remoteRepository.getTVChanges;

get getTVContentRating => remoteRepository.getTVContentRating;

get getTVCredit => remoteRepository.getTVCredit;

get getTVEpisodeGroups => remoteRepository.getTVEpisodeGroups;

get getTVExternalId => remoteRepository.getTVExternalId;

get getTVImage => remoteRepository.getTVImage;

get getTVKeyword => remoteRepository.getTVKeyword;

get getTVRecommendation => remoteRepository.getTVRecommendation;

get getTVReview => remoteRepository.getTVReview;

get getTVScreenedTheatrically => remoteRepository.getTVScreenedTheatrically;

get getSimilarTV => remoteRepository.getSimilarTV;

get getTVTranslation => remoteRepository.getTVTranslation;

get getTVVideo => remoteRepository.getTVVideo;

get getTVWatchProvider => remoteRepository.getTVWatchProvider;

get rateTV => remoteRepository.rateTV;

get deleteTVRate => remoteRepository.deleteTVRate;

get getLatestTV => remoteRepository.getLatestTV;

get getAiringTodayTV => remoteRepository.getAiringTodayTV;

get getOnTheAirTV => remoteRepository.getOnTheAirTV;

get getPopularTV => remoteRepository.getPopularTV;

get getTopRatedTV => remoteRepository.getTopRatedTV;
}
