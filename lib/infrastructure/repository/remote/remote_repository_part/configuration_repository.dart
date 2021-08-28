part of '../remote_repository.dart';

const ConfigurationPrefix = '/configuration';
mixin ConfigurationRepository {
  @GET('$ConfigurationPrefix')
  Future<Configuration> getAPIConfiguration();

  @GET('$ConfigurationPrefix/countries')
  Future<List<Country>> getConfigurationCountries();

  @GET('$ConfigurationPrefix/jobs')
  Future<List<Job>> getConfigurationJobs();

  @GET('$ConfigurationPrefix/languages')
  Future<List<Language>> getConfigurationLanguages();

  @GET('$ConfigurationPrefix/primary_translations')
  Future<List<String>> getConfigurationTranslations();

  @GET('$ConfigurationPrefix/timezones')
  Future<List<TimeZone>> getConfigurationTimezones();
}
