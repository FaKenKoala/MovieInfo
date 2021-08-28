part of '../app_service.dart';

mixin ConfigurationService on AppServicePart {
  /// Configuration
  Future<APIConfiguration> getAPIConfiguration() async {
    return localRepository.getAPIConfiguration().fold(() async {
      APIConfiguration remoteConfig = await remoteRepository.getAPIConfiguration();
      getIt<SharedPreferences>().setString(
          Constants.ImageGlobalConfigKey, json.encode(remoteConfig.toJson()));
      return remoteConfig;
    }, (a) => a);
  }

  get getConfigurationCountries => remoteRepository.getConfigurationCountries;

  get getConfigurationJobs => remoteRepository.getConfigurationJobs;

  get getConfigurationLanguages => remoteRepository.getConfigurationLanguages;

  get getConfigurationTranslations =>
      remoteRepository.getConfigurationTranslations;

  get getConfigurationTimezones => remoteRepository.getConfigurationTimezones;
}
