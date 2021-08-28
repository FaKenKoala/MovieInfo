import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_info/domain/model/list/new_list_content.dart';
import 'package:movie_info/infrastructure/app_method/app_method.dart';

part 'list_method.freezed.dart';

@freezed
class ListMethod with _$ListMethod implements AppMethod{
  const factory ListMethod.getMediaListDetail({required dynamic listId,}) = GetMediaListDetail;

  const factory ListMethod.getMediaListItemStatus({required dynamic listId,required int mediaId,}) = GetMediaListItemStatus;
  
  const factory ListMethod.createMediaList({required dynamic listId,required NewListContent newListContent,}) = CreateMediaList;
  
  const factory ListMethod.addMediaListItem({required dynamic listId, required int mediaId,}) = AddMediaListItem;
  
  const factory ListMethod.removeMediaListItem({required dynamic listId,required int mediaId,}) = RemoveMediaListItem;

  const factory ListMethod.clearMediaList({required dynamic listId,required bool confirm,}) = ClearMediaList;
  
  const factory ListMethod.deleteMediaList({required dynamic listId,}) = DeleteMediaList;
}