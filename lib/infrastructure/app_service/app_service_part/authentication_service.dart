part of '../app_service.dart';

mixin AuthenticationService on AppServicePart {
  Future<GuestSession> getGuestSession() async {

    _getRemote() async {
      GuestSession guestSession = await remoteRepository.getNewGuestSession();
      getIt<SharedPreferences>().setString(
          Constants.GuestSessionKey, json.encode(guestSession.toJson()));
      return guestSession;
    }

    return localRepository.getGuestSession().flatMap((guestSession) => catching(() {
        DateTime expireDate =
            DateTime.parse(guestSession.expiresAt.replaceAll('UTC', '').trim());
        bool isExpired = expireDate.isBefore(DateTime.now());

        if (isExpired) throw Exception('need new session');
        return guestSession;
      }).toOption()).fold(_getRemote, id);
  }
}
