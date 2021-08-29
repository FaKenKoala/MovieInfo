part of '../remote_repository.dart';

mixin AuthenticationRepository {
  @GET('/authentication/guest_session/new')
  Future<GuestSession> getGuestSession();

  @GET('/authentication/token/new')
  Future<RequestToken> getRequestToken();

  @POST('/authentication/session/new')
  Future<Session> createSession(
    @Body() Map<String, dynamic> requestToken,
  );

  @POST('/authentication/token/validate_with_login')
  Future<RequestToken> createSessionWithLogin(
    @Body() Map<String, dynamic> requestToken,
  );

  @POST('/authentication/session/convert/4')
  Future<Session> createSessionV4(
    @Body() Map<String, dynamic> accessToken,
  );

  @DELETE('/authentication/session')
  Future<Session> deleteSession(
    @Body() Map<String, dynamic> sessionId,
  );
}
