part of '../app_service.dart';

mixin ChangeService on AppServicePart {
  get getChangeMovies => remoteRepository.getChangeMovies;

  get getChangeTVs => remoteRepository.getChangeTVs;

  get getChangePersons => remoteRepository.getChangePersons;
}
