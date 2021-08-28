import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:movie_info/application/get_it/get_it_main.dart';
import 'package:movie_info/domain/model/configuration/configuration.dart';
import 'package:movie_info/domain/service/i_app_service.dart';
import 'package:movie_info/infrastructure/app_method/app_method.dart';

class ImageGlobalConfig {
  static ImageGlobalConfig? _instance;

  Configuration? _remoteConfig;
  late Configuration _assetConfig;

  ImageGlobalConfig._();

  static ImageGlobalConfig get instance {
    if (_instance == null) {
      init();
    }
    return _instance!;
  }

  Configuration get config {
    if (_remoteConfig == null) {
      // _getRemoteConfig();
      return _assetConfig;
    }
    return _remoteConfig!;
  }

  /// need to await this to confirm at least the assetConfig is loaded succesfully.
  static init() async {
    if (_instance == null) {
      _instance = ImageGlobalConfig._();
    }
    final localData = await rootBundle.load('assets/json/movie_config.json');
    String dataJson = utf8.decode(localData.buffer
        .asUint8List(localData.offsetInBytes, localData.lengthInBytes));
    _instance!._assetConfig = Configuration.fromJson(json.decode(dataJson));

    _instance!._getRemoteConfig();
  }

  _getRemoteConfig() async {
    if (_remoteConfig != null) {
      return;
    }

    AppExceptionEither<Configuration> result =
        await getIt<IAppService>().execute(GetConfiguration());

    result.fold((_) {}, (r) {
      _instance!._remoteConfig = r;
    });
  }

  static String imageUrl(String? posterPath) {
    return '${instance.config.images.secureBaseUrl}${instance.config.images.posterSizes[4]}$posterPath';
  }
}
