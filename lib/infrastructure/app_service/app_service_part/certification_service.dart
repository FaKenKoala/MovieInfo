part of '../app_service.dart';

mixin CertificationService on AppServicePart {
  get getCertificationMovieList => remoteRepository.getCertificationMovieList;

  get getCertificationTVList => remoteRepository.getCertificationTVList;
}
