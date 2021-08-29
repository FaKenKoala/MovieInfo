part of '../app_service.dart';

mixin AuthenticationService on AppServicePart {
  Future<GuestSession> getGuestSession() async {
    _getRemote() async {
      GuestSession guestSession = await remoteRepository.getGuestSession();
      getIt<SharedPreferences>().setString(
          Constants.GuestSessionKey, json.encode(guestSession.toJson()));
      return guestSession;
    }

    return localRepository
        .getGuestSession()
        .flatMap((guestSession) => catching(() {
              DateTime expireDate = DateTime.parse(
                  guestSession.expiresAt.replaceAll('UTC', '').trim());
              bool isExpired = expireDate.isBefore(DateTime.now());

              if (isExpired)
                throw Exception('Session expired, need new session.');
              return guestSession;
            }).toOption())
        .fold(_getRemote, id);
  }

  get getRequestToken => remoteRepository.getRequestToken();

  Future<Session> createSession() async {
    return await remoteRepository.createSession({
      'request_token': AppConfig.instance.requestToken?.requestToken,
    });
  }

  Future<RequestToken> createSessionWithLogin(
      String username, String password) async {
    return await remoteRepository.createSessionWithLogin({
      'username': username,
      'password': password,
      'request_token': AppConfig.instance.requestToken?.requestToken,
    });
  }

  Future<Session> createSessionV4() async {
    return await remoteRepository.createSessionV4({
      'access_token': Constants.TMDB_V4_ACCESS_TOKEN,
    });
  }

  Future<Session> deleteSession() async {
    return await remoteRepository.deleteSession({
      'session_id': AppConfig.instance.session?.sessionId,
    });
  }
}
