part of '../remote_repository.dart';

mixin FindRepository {
  @GET('/find/{external_id}')
  Future<FindResult> findByExternalID(
    @Path('external_id') String externalId,
    @Query('external_source') String externalSource,
  );
}
