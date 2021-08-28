part of '../app_service.dart';

mixin SearchService on AppServicePart {
  /// search person
  Future<PageResult<Person>> searchPerson(
      String query, int? page, bool? includeAdult, String? region) async {
    PageResult<Person> persons = await remoteRepository.searchPerson(
        query, page, includeAdult ?? true, region);

    return persons.copyWith(
        results: persons.results
            .map((person) => person.copyWith(
                  knownFor: person.knownFor.toMediaTypeList,
                ))
            .toList());
  }

  Future<PageResult> multiSearch(
      String query, int? page, bool? includeAdult, String? region) async {
    PageResult pageResult = await remoteRepository.multiSearch(
        query, page, includeAdult ?? true, region);

    return pageResult.copyWith(results: pageResult.results.toMediaTypeList);
  }

  get searchCompany => remoteRepository.searchCompany;
  
  get searchCollection => remoteRepository.searchCollection;
  
  get searchKeyword => remoteRepository.searchKeyword;
  
  get searchMovie => remoteRepository.searchMovie;
  
  get searchTV => remoteRepository.searchTV;
}
