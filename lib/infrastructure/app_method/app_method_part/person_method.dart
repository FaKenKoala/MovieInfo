import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_info/infrastructure/app_method/app_method.dart';
part 'person_method.freezed.dart';

@freezed
class PersonMethod with _$PersonMethod implements AppMethod {
  const factory PersonMethod.getPersonDetail({
    required int personId,
  }) = GetPersonDetail;

  const factory PersonMethod.getPersonChanges({
    required int personId,
    DateTime? startDate,
    DateTime? endDate,
    int? page,
  }) = GetPersonChanges;

  const factory PersonMethod.getPersonMovieCredits({
    required int personId,
  }) = GetPersonMovieCredits;

  const factory PersonMethod.getPersonTVCredits({
    required int personId,
  }) = GetPersonTVCredits;

  const factory PersonMethod.getPersonCombinedCredits({
    required int personId,
  }) = GetPersonCombinedCredits;

  const factory PersonMethod.getPersonExternalIds({
    required int personId,
  }) = GetPersonExternalIds;

  const factory PersonMethod.getPersonImages({
    required int personId,
  }) = GetPersonImages;

  const factory PersonMethod.getPersonTaggedImages({
    required int personId,
  }) = GetPersonTaggedImages;

  const factory PersonMethod.getPersonTranslations({
    required int personId,
  }) = GetPersonTranslations;

  const factory PersonMethod.getLatestPerson() = GetLatestPerson;

  const factory PersonMethod.getPopularPerson() = GetPopularPerson;
}
