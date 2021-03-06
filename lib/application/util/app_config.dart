import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:movie_info/application/get_it/get_it_main.dart';
import 'package:movie_info/domain/model/authentication/account.dart';
import 'package:movie_info/domain/model/authentication/guest_session.dart';
import 'package:movie_info/domain/model/authentication/request_token.dart';
import 'package:movie_info/domain/model/authentication/session.dart';
import 'package:movie_info/domain/model/configuration/configuration.dart';
import 'package:movie_info/domain/service/i_app_service.dart';
import 'package:movie_info/infrastructure/app_method/app_method.dart';
import 'package:movie_info/infrastructure/app_method/app_method_part/authentication_method.dart';
import 'package:movie_info/infrastructure/util/dio_util.dart';

class AppConfig {
  AppConfig._();

  static AppConfig? _instance;

  static AppConfig get instance {
    if (_instance == null) {
      init();
    }
    return _instance!;
  }

  APIConfiguration? _apiRemoteConfig;
  late APIConfiguration _assetConfig;

  APIConfiguration get config {
    if (_apiRemoteConfig == null) {
      return _assetConfig;
    }
    return _apiRemoteConfig!;
  }

  GuestSession? _guestSession;
  GuestSession? get guestSession => _guestSession;

  _getGuestSession() async {
    if (_guestSession != null) {
      return;
    }

    AppExceptionEither<GuestSession> session =
        await getIt<IAppService>().execute(GetGuestSession());

    session.fold((_) {}, (r) {
      _instance!._guestSession = r;
      addGuestSession();
    });
  }

  RequestToken? _requestToken;
  RequestToken? get requestToken => _requestToken;

  _getRequestToken() async {}

  Session? _session;
  Session? get session => _session;

  _getSession() async {}

  Account? _account;
  Account? get account => _account;

  _getAccount() async {}

  /// need to await this to confirm at least the assetConfig is loaded succesfully.
  static init() async {
    if (_instance == null) {
      _instance = AppConfig._();
    }
    final localData = await rootBundle.load('assets/json/movie_config.json');
    String dataJson = utf8.decode(localData.buffer
        .asUint8List(localData.offsetInBytes, localData.lengthInBytes));
    _instance!._assetConfig = APIConfiguration.fromJson(json.decode(dataJson));

    _instance!._getGuestSession();
    _instance!._getRemoteConfig();
  }

  _getRemoteConfig() async {
    if (_apiRemoteConfig != null) {
      return;
    }

    AppExceptionEither<APIConfiguration> result =
        await getIt<IAppService>().execute(GetAPIConfiguration());

    result.fold((_) {}, (r) {
      _instance!._apiRemoteConfig = r;
    });
  }

  static String poster(String? posterPath) {
    return '${instance.config.images.secureBaseUrl}${instance.config.images.posterSizes[3]}$posterPath';
  }

  static String backdrop(String? backdropPath) {
    return '${instance.config.images.secureBaseUrl}${instance.config.images.backdropSizes.last}$backdropPath';
  }

  static String logo(String? logoPath) {
    return '${instance.config.images.secureBaseUrl}${instance.config.images.logoSizes.last}$logoPath';
  }
}
