part of '../remote_repository.dart';

mixin ConfigurationRepository{
  @GET('/configuration')
  Future<Configuration> getApiConfiguration();
}