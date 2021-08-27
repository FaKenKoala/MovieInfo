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
}
