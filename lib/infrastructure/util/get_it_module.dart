import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constant.dart';

@module
abstract class SharedPreferencesModule {
  @singleton
  @preResolve
  Future<SharedPreferences> get sp => SharedPreferences.getInstance();
}

@module
abstract class DioModule {
  @Named('baseUrl')
  String get baseUrl => Constants.TMDB_BASE_URL;
  @singleton
  Dio get dio {
    /// TODO:If change locale， need change language query param.
    BaseOptions options = BaseOptions(
        baseUrl: baseUrl,
        queryParameters: {
          'api_key': Constants.TMDB_V3_API_KEY,
          'language': 'en',
          'session_id': null,
          'guest_session_id': null,
          'append_to_response': null,
        },
        connectTimeout: 6000,
        receiveTimeout: 6000,
        sendTimeout: 6000);
    return Dio(options);
  }
}
