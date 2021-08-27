part of '../app_service.dart';

mixin FindService on AppServicePart {
  Future<FindResult> findByExternalID(FindByExternalID find) async {
    return await remoteRepository.findByExternalID(
      externalId: find.externalId,
      externalSource: find.externalSource,
    );
  }
}
