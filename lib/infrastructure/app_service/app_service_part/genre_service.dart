part of '../app_service.dart';

mixin GenreService on AppServicePart {
  get getMovieGenreList => remoteRepository.getMovieGenreList;

  get getTVGenreList => remoteRepository.getTVGenreList;
}
