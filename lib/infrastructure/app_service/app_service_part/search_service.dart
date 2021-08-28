part of '../app_service.dart';

mixin SearchService on AppServicePart {
  /// search person
  get searchPerson => remoteRepository.searchPerson;

  get multiSearch => remoteRepository.multiSearch;

  get searchCompany => remoteRepository.searchCompany;

  get searchCollection => remoteRepository.searchCollection;

  get searchKeyword => remoteRepository.searchKeyword;

  get searchMovie => remoteRepository.searchMovie;

  get searchTV => remoteRepository.searchTV;
}
