import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_info/application/get_it/get_it_main.dart';
import 'package:movie_info/domain/model/configuration/configuration.dart';
import 'package:movie_info/infrastructure/util/constant.dart';
import 'package:movie_info/infrastructure/util/movie_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class LocalRepository {
  Option<Configuration> getConfiguration() {
    String? configString =
        getIt<SharedPreferences>().get(Constants.ImageGlobalConfig) as String?;
    if (configString != null) {
      Configuration configuration =
          Configuration.fromJson(jsonDecode(configString));
      MovieLog.print('本地存储: ${configuration.toJson()}');
      return some(configuration);
    }
    return none();
  }
}
