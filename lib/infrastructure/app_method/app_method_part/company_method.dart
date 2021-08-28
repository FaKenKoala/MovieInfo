import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_info/infrastructure/app_method/app_method.dart';
part 'company_method.freezed.dart';

@freezed
class CompanyMethod with _$CompanyMethod implements AppMethod {
  const factory CompanyMethod.getCompanyDetail({
    required int companyId,
  }) = GetCompanyDetail;

  const factory CompanyMethod.getCompanyAlternativeNames({
    required int companyId,
  }) = GetCompanyAlternativeNames;

  const factory CompanyMethod.getCompanyLogos({
    required int companyId,
  }) = GetCompanyLogos;
}
