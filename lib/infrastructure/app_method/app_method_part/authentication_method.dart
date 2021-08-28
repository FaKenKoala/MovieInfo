import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_info/infrastructure/app_method/app_method.dart';

part 'authentication_method.freezed.dart';

@freezed
class AuthenticationMethod with _$AuthenticationMethod implements AppMethod {
  factory AuthenticationMethod.getGuestSession() = GetGuestSession;
}
