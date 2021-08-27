part of '../app_service.dart';

mixin CreditService on AppServicePart {
  /// Trending
  Future<Credit> getCreditDetail(GetCreditDetail detail) async {
    Credit credit = await remoteRepository.getCreditDetail(detail.creditId);

    List<dynamic>? results = credit.person?.knownFor.toMediaTypeList;
    return credit.copyWith(person: credit.person?.copyWith(knownFor: results));
  }
}
