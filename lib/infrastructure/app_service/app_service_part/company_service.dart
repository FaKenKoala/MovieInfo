part of '../app_service.dart';

mixin CompanyService on AppServicePart {
  get getCompanyDetail => remoteRepository.getCompanyDetail;

  get getCompanyAlternativeNames => remoteRepository.getCompanyAlternativeNames;

  get getCompanyLogos => remoteRepository.getCompanyLogos;
}
