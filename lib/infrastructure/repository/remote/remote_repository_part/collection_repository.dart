part of '../remote_repository.dart';

mixin CollectionRepository {
  @GET('/collectioin/{collection_id}')
  Future<TranslationList> getCollectionDetail(
    @Path('collection_id') int collectionId,
  );

  @GET('/collectioin/{collection_id}/images')
  Future<MediaImageList> getCollectionImages(
    @Path('collection_id') int collectionId,
  );

  @GET('/collectioin/{collection_id}/translations')
  Future<TranslationList> getCollectionTranslation(
    @Path('collection_id') int collectionId,
  );
}
