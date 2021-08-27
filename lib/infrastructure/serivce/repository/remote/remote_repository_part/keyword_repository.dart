part of '../remote_repository.dart';

mixin KeywordRepository {
  @GET('/keyword/{keyword_id}')
  Future<MediaKeyword> getKeywordDetail(
    @Path('keyword_id') int keywordId,
  );

  @GET('/keyword/{keyword_id}/movies')
  Future<PageResult<Movie>> getKeywordMovies(
    @Path('keyword_id') int keywordId,
    @Query('include_adult') bool includeAdult,
  );
}
