part of '../remote_repository.dart';

mixin SearchRepository {
  @GET('/search/company')
  Future<PageResult<Company>> searchCompany(
    @Query('query') String query,
    @Query('page') int? page,
  );

  @GET('/search/collection')
  Future<PageResult<Collection>> searchCollection(
    @Query('query') String query,
    @Query('page') int? page,
  );

  @GET('/search/keyword')
  Future<PageResult<MediaKeyword>> searchKeyword(
    @Query('query') String query,
    @Query('page') int? page,
  );

  @GET('/search/movie')
  Future<PageResult<Movie>> searchMovie(
    @Query('query') String query,
    @Query('page') int? page,
    @Query('include_adult') bool? includeAdult,
    @Query('region') String? region,
    @Query('year') int? year,
    @Query('primary_release_year') int? primaryReleaseYear,
  );

  @GET('/search/multi')
  Future multiSearch(
    @Query('query') String query,
    @Query('page') int? page,
    @Query('include_adult') bool? includeAdult,
    @Query('region') String? region,
  );

  @GET('/search/person')
  Future<PageResult<Person>> searchPerson(
    @Query('query') String query,
    @Query('page') int? page,
    @Query('include_adult') bool? includeAdult,
    @Query('region') String? region,
  );

  @GET('/search/tv')
  Future<PageResult<TV>> searchTV(
    @Query('query') String query,
    @Query('page') int? page,
    @Query('include_adult') bool? includeAdult,
    @Query('first_air_date_year') int? firstAirDateYear,
  );
}
