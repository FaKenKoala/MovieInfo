part of '../app_service.dart';

mixin TVPart on AppServicePart {
  /// TV Details
  Future<TV> getTVDetail(GetTVDetail detail) async {
    return await remoteRepository.getTVDetail(
        tvId: detail.tvId,
        appendToResponse: detail.appendToResponse);
  }
}
