import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_info/infrastructure/app_method/app_method.dart';
part 'configuration_method.freezed.dart';

@freezed
class ConfigurationMethod with _$ConfigurationMethod implements AppMethod{
  const factory ConfigurationMethod.getAPIConfiguration() = GetAPIConfiguration;
  const factory ConfigurationMethod.getConfigurationCountries() = GetConfigurationCountries;

const factory ConfigurationMethod.getConfigurationJobs() = GetConfigurationJobs;
const factory ConfigurationMethod.getConfigurationLanguages() = GetConfigurationLanguages;
const factory ConfigurationMethod.getConfigurationTranslations() = GetConfigurationTranslations;
const factory ConfigurationMethod.getConfigurationTimezones() = GetConfigurationTimezones;
}
