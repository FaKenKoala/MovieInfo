part of '../remote_repository.dart';

mixin GenreRepository {
  @GET('/genre/movie/list')
  Future<GenreList> getMovieGenreList();
  @GET('/genre/tv/list')
  Future<GenreList> getTVGenreList();
}
