import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_info/infrastructure/app_method/app_method.dart';
part 'watch_provider_method.freezed.dart';

@freezed
class WatchProviderMethod with _$WatchProviderMethod implements AppMethod{
  const factory WatchProviderMethod.getAvailableRegions() = GetAvailableRegions;
  const factory WatchProviderMethod.getMovieProviders({String? watchRegion}) = GetMovieProviders;
  const factory WatchProviderMethod.getTVProviders({String? watchRegion}) = GetTVProviders;
}