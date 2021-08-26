part of '../app_service.dart';

mixin FindPart on AppServicePart {
  Future<FindResult> findByExternalID(FindByExternalID find) async {
    return await remoteRepository.findByExternalID(
      externalId: find.externalId,
      language: find.language,
      externalSource: find.externalSource,
    );
  }
}
