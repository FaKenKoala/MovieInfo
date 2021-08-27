part of '../app_service.dart';

mixin KeywordService on AppServicePart {
  get getKeywordDetail => remoteRepository.getKeywordDetail;
  get getKeywordMovies => remoteRepository.getKeywordMovies;
}
