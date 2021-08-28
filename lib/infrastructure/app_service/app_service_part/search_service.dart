part of '../app_service.dart';

mixin SearchService on AppServicePart {
  /// Trending
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
}
