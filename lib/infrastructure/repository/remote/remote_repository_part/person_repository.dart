part of '../remote_repository.dart';

const PersonPrefix = '/person/{$PersonID}';
const PersonID = 'person_id';
mixin PersonRepository {
  @GET('$PersonPrefix')
  Future<Person> getPersonDetail(
    @Path(PersonID) int personId,
  );

  @GET('$PersonPrefix/changes')
  Future<ChangeList> getPersonChanges(
    @Path(PersonID) int personId,
    @Query('start_date') String? startDate,
    @Query('end_date') String? endDate,
    @Query('page') int? page,
  );

  @GET('$PersonPrefix/movie_credits')
  Future<CreditList> getPersonMovieCredits(
    @Path(PersonID) int personId,
  );

  @GET('$PersonPrefix/tv_credits')
  Future<CreditList> getPersonTVCredits(
    @Path(PersonID) int personId,
  );

  @GET('$PersonPrefix/combined_credits')
  Future<CreditList> getPersonCombinedCredits(
    @Path(PersonID) int personId,
  );

  @GET('$PersonPrefix/external_ids')
  Future getPersonExternalIds(
    @Path(PersonID) int personId,
  );

  @GET('$PersonPrefix/images')
  Future getPersonImages(
    @Path(PersonID) int personId,
  );

  @GET('$PersonPrefix/tagged_images')
  Future getPersonTaggedImages(
    @Path(PersonID) int personId,
  );

  @GET('$PersonPrefix/translations')
  Future getPersonTranslations(
    @Path(PersonID) int personId,
  );

  @GET('/person/latest')
  Future getLatestPerson();

  @GET('/person/popular')
  Future getPopularPerson();
}
