import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_info/infrastructure/app_method/app_method.dart';
part 'network_method.freezed.dart';

@freezed
class NetworkMethod with _$NetworkMethod implements AppMethod {
  const factory NetworkMethod.getNetworkDetail({required int networkId}) =
      GetNetworkDetail;

  const factory NetworkMethod.getNetworkAlternativeNames(
      {required int networkId}) = GetNetwrokAlternativeNames;

  const factory NetworkMethod.getNetworkLogos({required int networkId}) =
      GetNetworkLogos;
}
