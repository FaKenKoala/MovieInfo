import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_info/infrastructure/app_method/app_method.dart';
part 'collection_method.freezed.dart';

@freezed
class CollectionMethod with _$CollectionMethod implements AppMethod {
  const factory CollectionMethod.getCollectionDetail({
    required int collectionId,
  }) = GetCollectionDetail;

  const factory CollectionMethod.getCollectionImages({
    required int collectionId,
  }) = GetCollectionImages;

  const factory CollectionMethod.getCollectionTranslations({
    required int collectionId,
  }) = GetCollectionTranslations;
}
