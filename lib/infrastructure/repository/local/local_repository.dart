import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_info/application/get_it/get_it_main.dart';
import 'package:movie_info/domain/model/authentication/guest_session.dart';
import 'package:movie_info/domain/model/configuration/configuration.dart';
import 'package:movie_info/infrastructure/util/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class LocalRepository {
  Option<APIConfiguration> getAPIConfiguration() {
    return optionOf(getIt<SharedPreferences>().get(Constants.ImageGlobalConfigKey)
            as String?)
        .map((configString) {
      return APIConfiguration.fromJson(jsonDecode(configString));
    });
  }

  Option<GuestSession> getGuestSession() {
    return optionOf(
            getIt<SharedPreferences>().get(Constants.GuestSessionKey) as String?)
        .map((sessionString) =>
            GuestSession.fromJson(jsonDecode(sessionString)));
  }
}
