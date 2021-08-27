part of '../remote_repository.dart';

mixin ChangeRepository {
  @GET('/movie/changes')
  Future<PageResult<Movie>> getChangeMovies();

  @GET('/tv/changes')
  Future<PageResult<TV>> getChangeTVs();

  @GET('/person/changes')
  Future<PageResult<Person>> getChangePersons();
}
