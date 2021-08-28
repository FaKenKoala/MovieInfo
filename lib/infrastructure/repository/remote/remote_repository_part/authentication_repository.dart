part of '../remote_repository.dart';

mixin AuthenticationRepository {
  @GET('/authentication/guest_session/new')
  Future<GuestSession> getNewGuestSession();
}
