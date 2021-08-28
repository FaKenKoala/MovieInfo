part of '../remote_repository.dart';

mixin ListRepository {
  @GET('/list/{list_id}')
  Future<MediaList> getMediaListDetail(
    @Path('list_id') dynamic listId,
  );

  @GET('/list{list_id}/item_status')
  Future<MediaItemStatus> getMediaListItemStatus(
    @Path('list_id') dynamic listId,
    @Query('movie_id')int movieId,
  );

  @POST('/list')
  Future<NewListResponse> createMediaList(
    @Body() NewListContent listContent,
  );

  @POST('/list/{list_id}/add_item')
  Future<CodeResponse> addMediaListItem(
    @Path('list_id') dynamic listId,
    @Body() AddListItem item,
  );

  @POST('/list/{list_id}/remove_item')
  Future<CodeResponse> removeMediaListItem(
    @Path('list_id') dynamic listId,
    @Body() AddListItem item,
  );

  @POST('/list/{list_id}/clear')
  Future<CodeResponse> clearMediaList(
    @Path('list_id') dynamic listId,
    @Query('confirm') bool confirm,
  );

  @DELETE('/list/{list_id}')
  Future<CodeResponse> deleteMediaList(
    @Path('list_id') dynamic listId,
  );
}
