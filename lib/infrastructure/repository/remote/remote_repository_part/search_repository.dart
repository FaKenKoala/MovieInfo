part of '../remote_repository.dart';

mixin SearchRepository {
  @GET('/search/company')
  Future searchCompany(
    @Query('query') String query,
    @Query('page') int? page,
  );

  @GET('/search/collection')
  Future searchCollection(
    @Query('query') String query,
    @Query('page') int? page,
  );

  @GET('/search/keyword')
  Future searchKeyword(
    @Query('query') String query,
    @Query('page') int? page,
  );

  @GET('/search/movie')
  Future searchMovie(
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
  Future searchPerson(
    @Query('query') String query,
    @Query('page') int? page,
    @Query('include_adult') bool? includeAdult,
    @Query('region') String? region,
  );

  @GET('/search/tv')
  Future searchTV(
    @Query('query') String query,
    @Query('page') int? page,
    @Query('include_adult') bool? includeAdult,
    @Query('first_air_date_year') int? firstAirDateYear,
  );
}
