import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_info/infrastructure/app_method/app_method.dart';

part 'certification_method.freezed.dart';

@freezed
class CertificationMethod with _$CertificationMethod implements AppMethod {
  const factory CertificationMethod.getCertificationMovieList() = GetCertificationMovieList;
  const factory CertificationMethod.getCertificationTVList() = GetCertificationTVList;
}
