part of '../remote_repository.dart';

mixin FindPart {
  @GET('/find/{external_id}')
  Future<FindResult> findByExternalID({
    @Path('external_id') required String externalId,
    @Query('external_source') required String externalSource,
  });
}
