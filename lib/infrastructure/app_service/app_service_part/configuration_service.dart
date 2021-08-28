part of '../app_service.dart';

mixin ConfigurationService on AppServicePart {
  /// Configuration
  Future<Configuration> getAPIConfiguration() async {
    return localRepository.getAPIConfiguration().fold(() async {
      Configuration remoteConfig = await remoteRepository.getAPIConfiguration();
      getIt<SharedPreferences>().setString(
          Constants.ImageGlobalConfig, json.encode(remoteConfig.toJson()));
      return remoteConfig;
    }, (a) => a);
  }
}
