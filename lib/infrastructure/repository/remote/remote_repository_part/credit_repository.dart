part of '../remote_repository.dart';

mixin CreditRepository {
  @GET('/credit/{credit_id}')
  Future<Credit> getCreditDetail(
    @Path('credit_id') String creditId,
  );
}
