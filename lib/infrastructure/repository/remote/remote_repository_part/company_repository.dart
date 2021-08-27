part of '../remote_repository.dart';

mixin CompanyRepository {
  @GET('/company/{company_id}')
  Future<Company> getCompanyDetail(
    @Path('company_id') int companyId,
  );

  @GET('/company/{company_id}/alternative_names')
  Future<IDResult<MediaName>> getCompanyAlternativeNames(
    @Path('company_id') int companyId,
  );

  @GET('/company/{company_id}/images')
  Future<MediaImageList> getCompanyLogos(
    @Path('company_id') int companyId,
  );
}
