part of '../remote_repository.dart';

mixin CertificationRepository {
  @GET('/certification/movie/list')
  Future<CertificationList> getCertificationMovieList();

  @GET('/certification/tv/list')
  Future<CertificationList> getCertificationTVList();
}
