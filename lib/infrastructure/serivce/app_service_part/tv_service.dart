part of '../app_service.dart';

mixin TVService on AppServicePart {
  /// TV Details
  get getTVDetail => remoteRepository.getTVDetail;

  /// TV Account State
  get getTVAccountState => remoteRepository.getTVAccountState;
}
