part of '../remote_repository.dart';

mixin NetworkRepository {
  @GET('/network/{network_id}')
  Future<Network> getNetworkDetail(@Path('network_id') int networkId);
  @GET('/network/{network_id}/alternative_names')
  Future<IDResult<NetworkName>> getNetworkAlternativeNames(
      @Path('network_id') int networkId);
  @GET('/network/{network_id}/images')
  Future<MediaImageList> getNetworkLogos(@Path('network_id') int networkId);
}
