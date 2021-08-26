part of '../app_service.dart';

mixin ConfigurationPart on AppServicePart{
  /// Configuration
  Future<Configuration> getConfiguration(
      GetConfiguration getConfiguration) async {
    return localRepository.getConfiguration().fold(() async {
      Configuration remoteConfig = await remoteRepository.configuration();
      getIt<SharedPreferences>().setString(
          Constants.ImageGlobalConfig, json.encode(remoteConfig.toJson()));
      return remoteConfig;
    }, (a) => a);
  }
}