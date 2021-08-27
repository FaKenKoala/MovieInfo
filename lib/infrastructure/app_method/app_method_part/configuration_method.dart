import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_info/infrastructure/app_method/app_method.dart';
part 'configuration_method.freezed.dart';

@freezed
class ConfigurationMethod with _$ConfigurationMethod implements AppMethod{
  const factory ConfigurationMethod.getConfiguration() = GetConfiguration;
}
