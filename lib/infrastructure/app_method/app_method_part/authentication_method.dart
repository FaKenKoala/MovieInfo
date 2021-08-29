import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_info/infrastructure/app_method/app_method.dart';

part 'authentication_method.freezed.dart';

@freezed
class AuthenticationMethod with _$AuthenticationMethod implements AppMethod {
  const factory AuthenticationMethod.getGuestSession() = GetGuestSession;

  const factory AuthenticationMethod.getRequestToken() = GetRequestToken;

  const factory AuthenticationMethod.createSession() = CreateSession;

  const factory AuthenticationMethod.createSessionWithLogin({
    required String username,
    required String password,
  }) = CreateSessionWithLogin;

  const factory AuthenticationMethod.createSessionV4() = CreateSessionV4;

  const factory AuthenticationMethod.deleteSession() = DeleteSession;
}
